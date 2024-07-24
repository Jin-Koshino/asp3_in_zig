///
///  カーネル性能評価プログラム(4)のシステムコンフィギュレーション記述
///
///  $Id$
///
const kernel_cfg = @import("../kernel/kernel_cfg.zig");

const tecs = @import("../OBJ-ARM/gen/tecsgen_cfg.zig");

usingnamespace @cImport({
    @cDefine("UINT_C(val)", "val");
    @cInclude("perf4.h");
});

fn configuration(comptime cfg: *CfgData) void {
    tecs.configuration(cfg);
    cfg.CRE_TSK("TASK1", CTSK(TA_NULL, 1, task1, TASK1_PRIORITY, STACK_SIZE, null));
    cfg.CRE_TSK("TASK2", CTSK(TA_NULL, 2, task2, TASK2_PRIORITY, STACK_SIZE, null));
    cfg.CRE_TSK("TASK3", CTSK(TA_NULL, 3, task3, TASK3_PRIORITY, STACK_SIZE, null));
    cfg.CRE_TSK("TASK4", CTSK(TA_ACT, 4, task4, TASK4_PRIORITY, STACK_SIZE, null));
    cfg.CRE_CYC("CYC1", CCYC(TA_NULL, NFY_TMEHDR(0, cyclic_handler), CYC1_CYCLE, CYC1_CYCLE));
    cfg.CRE_TSK("MAIN_TASK", CTSK(TA_ACT, 0, main_task, MAIN_PRIORITY, STACK_SIZE, null));
}

//
//  静的APIの読み込みとコンフィギュレーションデータの生成
//
//  以下は変更する必要がない．
//
//  genConfigにvoid型のパラメータを渡すのは，Zigコンパイラの不具合の回
//  避のため（これがないと，genConfigが2回実行される）．
//
fn genConfig(comptime dummy: void) type {
    comptime var cfg = CfgData{};
    target.configuration(&cfg);
    configuration(&cfg);
    return GenCfgData(&cfg);
}
export const _ = genConfig({}){};
