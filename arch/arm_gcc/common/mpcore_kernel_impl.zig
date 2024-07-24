///
///  kernel_impl.zigのMPCore依存部
///
const kernel_impl = @import("../../../kernel/kernel_impl.zig");

///
///  MPCoreのハードウェア資源の定義
///
const mpcore = @import("mpcore.zig");

///
///  コア依存部
///
pub const core_kernel_impl = @import("core_kernel_impl.zig");

////
const core_initialize = core_kernel_impl.core_initialize;
const core_terminate = core_kernel_impl.core_terminate;
////

///
///  GIC依存部
///
pub const gic_kernel_impl = @import("gic_kernel_impl.zig");

////
const gicd_initialize = gic_kernel_impl.gicd_initialize;
const gicc_initialize = gic_kernel_impl.gicc_initialize;
const gicc_terminate = gic_kernel_impl.gicc_terminate;
const gicd_terminate = gic_kernel_impl.gicd_terminate;
////

///
///  用いるライブラリ
///
const arm = @import("arm.zig");

///
///  MPCore依存の初期化
///
pub fn mpcore_initialize() void {
    // キャッシュをディスエーブル
    arm.disable_cache();

    // コア依存の初期化
    core_initialize();

    // MPCoreをSMPモードに設定
    //
    // Shareable属性のメモリ領域をキャッシュ有効にするには，シングルコ
    // アであっても，SMPモードに設定されている必要がある．
    //
    mpcore.enable_smp();

    // SCUをイネーブル
    mpcore.enable_scu();

    // キャッシュをイネーブル
    arm.enable_cache();

    // GICのディストリビュータの初期化
    gicd_initialize();

    // GICのCPUインタフェースの初期化
    gicc_initialize();

    // 分岐予測の無効化とイネーブル
    arm.invalidate_bp();
    arm.enable_bp();
}

///
///  MPcore依存の終了処理
///
pub fn mpcore_terminate() void {
    // GICのCPUインタフェースの終了処理
    gicc_terminate();

    // GICのディストリビュータの終了処理
    gicd_terminate();

    // コア依存の終了処理
    core_terminate();
}
