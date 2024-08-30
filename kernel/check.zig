///
///  TOPPERS/ASP Kernel
///      Toyohashi Open Platform for Embedded Real-Time Systems/
///      Advanced Standard Profile Kernel
///
///  Copyright (C) 2000-2003 by Embedded and Real-Time Systems Laboratory
///                                 Toyohashi Univ. of Technology, JAPAN
///  Copyright (C) 2005-2020 by Embedded and Real-Time Systems Laboratory
///                 Graduate School of Informatics, Nagoya Univ., JAPAN
///
///  上記著作権者は，以下の(1)〜(4)の条件を満たす場合に限り，本ソフトウェ
///  ア（本ソフトウェアを改変したものを含む．以下同じ）を使用・複製・改
///  変・再配布（以下，利用と呼ぶ）することを無償で許諾する．
///  (1) 本ソフトウェアをソースコードの形で利用する場合には，上記の著作
///      権表示，この利用条件および下記の無保証規定が，そのままの形でソー
///      スコード中に含まれていること．
///  (2) 本ソフトウェアを，ライブラリ形式など，他のソフトウェア開発に使
///      用できる形で再配布する場合には，再配布に伴うドキュメント（利用
///      者マニュアルなど）に，上記の著作権表示，この利用条件および下記
///      の無保証規定を掲載すること．
///  (3) 本ソフトウェアを，機器に組み込むなど，他のソフトウェア開発に使
///      用できない形で再配布する場合には，次のいずれかの条件を満たすこ
///      と．
///    (a) 再配布に伴うドキュメント（利用者マニュアルなど）に，上記の著
///        作権表示，この利用条件および下記の無保証規定を掲載すること．
///    (b) 再配布の形態を，別に定める方法によって，TOPPERSプロジェクトに
///        報告すること．
///  (4) 本ソフトウェアの利用により直接的または間接的に生じるいかなる損
///      害からも，上記著作権者およびTOPPERSプロジェクトを免責すること．
///      また，本ソフトウェアのユーザまたはエンドユーザからのいかなる理
///      由に基づく請求からも，上記著作権者およびTOPPERSプロジェクトを
///      免責すること．
///
///  本ソフトウェアは，無保証で提供されているものである．上記著作権者お
///  よびTOPPERSプロジェクトは，本ソフトウェアに関して，特定の使用目的
///  に対する適合性も含めて，いかなる保証も行わない．また，本ソフトウェ
///  アの利用により直接的または間接的に生じたいかなる損害に関しても，そ
///  の責任を負わない．
///
///  $Id$
///
///
///		エラーチェック用関数
///
const kernel_impl = @import("kernel_impl.zig");

////
const zig = kernel_impl.zig;
const t_stddef = zig.t_stddef;

const RELTIM = t_stddef.RELTIM;
const TMAX_RELTIM = t_stddef.TMAX_RELTIM;
const TMO = t_stddef.TMO;
const TMO_FEVR = t_stddef.TMO_FEVR;
const ItronError = t_stddef.ItronError;
const target_impl = kernel_impl.target_impl;
const task = kernel_impl.task;
const ATR = t_stddef.ATR;
////

///
///  相対時間の範囲の判定
///
pub fn validRelativeTime(reltim: RELTIM) bool {
    return reltim <= TMAX_RELTIM;
}

///
///  タイムアウト指定値の範囲の判定
///
pub fn validTimeout(tmout: TMO) bool {
    return (tmout <= TMAX_RELTIM or tmout == TMO_FEVR);
}

///
///  呼出しコンテキストのチェック（ContextError）
///
pub fn checkContextTask() ItronError!void {
    if (target_impl.mpcore_kernel_impl.core_kernel_impl.senseContext()) {
        return ItronError.ContextError;
    }
}

///
///  CPUロック状態のチェック（ContextError）
///
pub fn checkContextUnlock() ItronError!void {
    if (target_impl.mpcore_kernel_impl.core_kernel_impl.senseLock()) {
        return ItronError.ContextError;
    }
}

///
///  呼出しコンテキストとCPUロック状態のチェック（ContextError）
///
pub fn checkContextTaskUnlock() ItronError!void {
    if (target_impl.mpcore_kernel_impl.core_kernel_impl.senseContext() or target_impl.mpcore_kernel_impl.core_kernel_impl.senseLock()) {
        return ItronError.ContextError;
    }
}

///
///  ディスパッチ保留状態でないかのチェック（ContextError）
///
pub fn checkDispatch() ItronError!void {
    if (target_impl.mpcore_kernel_impl.core_kernel_impl.senseContext() or target_impl.mpcore_kernel_impl.core_kernel_impl.senseLock() or !task.dspflg) {
        return ItronError.ContextError;
    }
}

///
///  不正ID番号のチェック（IdError）
///
pub fn checkId(ok: bool) ItronError!void {
    if (!ok) {
        return ItronError.IdError;
    }
}

///
///  予約属性のチェック（ReservedAttribute）
///
pub fn checkAttribute(ok: bool) ItronError!void {
    if (!ok) {
        return ItronError.ReservedAttribute;
    }
}

///
///  属性が無効なビットが立っていないかのチェック（ReservedAttribute）
///
pub fn checkValidAtr(atr: ATR, valid_atr: ATR) ItronError!void {
    if ((atr & ~valid_atr) != 0) {
        return ItronError.ReservedAttribute;
    }
}

///
///  パラメータエラーのチェック（ParameterError）
///
pub fn checkParameter(ok: bool) ItronError!void {
    if (!ok) {
        return ItronError.ParameterError;
    }
}

///
///  サービスコール不正使用のチェック（IllegalUse）
///
pub fn checkIllegalUse(ok: bool) ItronError!void {
    if (!ok) {
        return ItronError.IllegalUse;
    }
}

///
///  オブジェクト状態エラーのチェック（ObjectStateError）
///
pub fn checkObjectState(ok: bool) ItronError!void {
    if (!ok) {
        return ItronError.ObjectStateError;
    }
}

///
///  未サポート機能のチェック（NotSupported）
///
pub fn checkNotSupported(comptime ok: bool) ItronError!void {
    if (!ok) {
        return ItronError.NotSupported;
    }
}

///
///  整合性のチェック（SystemError）
///
pub fn checkBit(ok: bool) ItronError!void {
    if (!ok) {
        return ItronError.SystemError;
    }
}
