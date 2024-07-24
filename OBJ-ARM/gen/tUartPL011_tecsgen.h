/*
 * This file was automatically generated by tecsgen.
 * This file is not intended to be edited.
 */
#ifndef tUartPL011_TECSGEN_H
#define tUartPL011_TECSGEN_H

/*
 * celltype          :  tUartPL011
 * global name       :  tUartPL011
 * multi-domain      :  no
 * idx_is_id(actual) :  no(no)
 * singleton         :  no
 * has_CB            :  yes
 * has_INIB          :  yes
 * rom               :  yes
 * CB initializer    :  yes
 */

/* global header #_IGH_# */
#include "global_tecsgen.h"

/* signature header #_ISH_# */
#include "sSIOPort_tecsgen.h"
#include "siSIOCBR_tecsgen.h"
#include "siHandlerBody_tecsgen.h"
#include "sRoutineBody_tecsgen.h"

#ifndef TOPPERS_MACRO_ONLY

#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */
/* cell INIB type definition #_CIP_# */
typedef const struct tag_tUartPL011_INIB {
    /* call port #_TCP_# */
    /* call port #_NEP_# */ 
    /* attribute(RO) #_ATO_# */ 
    uintptr_t      baseAddress;
    uint8_t        ibrd;
    uint8_t        fbrd;
    uint8_t        lcr_h;
}  tUartPL011_INIB;
/* cell CB type definition #_CCTPA_# */
typedef struct tag_tUartPL011_CB {
    tUartPL011_INIB  *_inib;
    /* call port #_TCP_# */
    /* call port #_NEP_# */ 
    /* var #_VA_# */ 
    bool_t         opened;
}  tUartPL011_CB;
/* singleton cell CB prototype declaration #_MCPB_# */
extern tUartPL011_CB  tUartPL011_CB_tab[];

/* celltype IDX type #_CTIX_# */
typedef struct tag_tUartPL011_CB *tUartPL011_IDX;

/* prototype declaration of entry port function #_EPP_# */
/* sSIOPort */
void         tUartPL011_eSIOPort_open(tUartPL011_IDX idx);
void         tUartPL011_eSIOPort_close(tUartPL011_IDX idx);
bool_t       tUartPL011_eSIOPort_putChar(tUartPL011_IDX idx, char c);
int_t        tUartPL011_eSIOPort_getChar(tUartPL011_IDX idx);
void         tUartPL011_eSIOPort_enableCBR(tUartPL011_IDX idx, uint_t cbrtn);
void         tUartPL011_eSIOPort_disableCBR(tUartPL011_IDX idx, uint_t cbrtn);
/* siHandlerBody */
void         tUartPL011_eiISR_main(tUartPL011_IDX idx);
/* sRoutineBody */
void         tUartPL011_eTerminate_main(tUartPL011_IDX idx);
#ifdef __cplusplus
}
#endif /* __cplusplus */
#endif /* TOPPERS_MACRO_ONLY */

/* to get the definition of CB type of referenced celltype for optimization #_ICT_# */
#ifndef  TOPPERS_CB_TYPE_ONLY
#define  tUartPL011_CB_TYPE_ONLY
#define TOPPERS_CB_TYPE_ONLY
#endif  /* TOPPERS_CB_TYPE_ONLY */
#include "tSIOPortCT11MPCoreMain_tecsgen.h"
#ifdef  tUartPL011_CB_TYPE_ONLY
#undef TOPPERS_CB_TYPE_ONLY
#endif /* tUartPL011_CB_TYPE_ONLY */
#ifndef TOPPERS_CB_TYPE_ONLY

#define tUartPL011_ID_BASE          (1)  /* ID Base  #_NIDB_# */
#define tUartPL011_N_CELL           (1)  /*  number of cells  #_NCEL_# */

/* IDX validation macro #_CVI_# */
#define tUartPL011_VALID_IDX(IDX) (1)


/* celll CB macro #_GCB_# */
#define tUartPL011_GET_CELLCB(idx) (idx)

/* attr access  #_AAM_# */
#define tUartPL011_ATTR_baseAddress( p_that )	((p_that)->_inib->baseAddress)
#define tUartPL011_ATTR_ibrd( p_that )	((p_that)->_inib->ibrd)
#define tUartPL011_ATTR_fbrd( p_that )	((p_that)->_inib->fbrd)
#define tUartPL011_ATTR_lcr_h( p_that )	((p_that)->_inib->lcr_h)

#define tUartPL011_GET_baseAddress(p_that)	((p_that)->_inib->baseAddress)
#define tUartPL011_GET_ibrd(p_that)	((p_that)->_inib->ibrd)
#define tUartPL011_GET_fbrd(p_that)	((p_that)->_inib->fbrd)
#define tUartPL011_GET_lcr_h(p_that)	((p_that)->_inib->lcr_h)


/* var access macro #_VAM_# */
#define tUartPL011_VAR_opened(p_that)	((p_that)->opened)

#define tUartPL011_GET_opened(p_that)	((p_that)->opened)
#define tUartPL011_SET_opened(p_that,val)	((p_that)->opened=(val))

#ifndef TECSFLOW
 /* call port function macro #_CPM_# */
#define tUartPL011_ciSIOCBR_readySend( p_that ) \
	  tSIOPortCT11MPCoreMain_eiSIOCBR_readySend( \
	   (tSIOPortCT11MPCoreMain_IDX)0 )
#define tUartPL011_ciSIOCBR_readyReceive( p_that ) \
	  tSIOPortCT11MPCoreMain_eiSIOCBR_readyReceive( \
	   (tSIOPortCT11MPCoreMain_IDX)0 )

#else  /* TECSFLOW */
#define tUartPL011_ciSIOCBR_readySend( p_that ) \
	  (p_that)->ciSIOCBR.readySend__T( \
 )
#define tUartPL011_ciSIOCBR_readyReceive( p_that ) \
	  (p_that)->ciSIOCBR.readyReceive__T( \
 )

#endif /* TECSFLOW */
#endif /* TOPPERS_CB_TYPE_ONLY */

#ifndef TOPPERS_MACRO_ONLY

#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */

/* prototype declaration of entry port function (referenced when VMT useless optimise enabled) #_EPSP_# */
/* eTerminate */
void           tUartPL011_eTerminate_main_skel( const struct tag_sRoutineBody_VDES *epd);

#ifndef TOPPERS_CB_TYPE_ONLY

#endif /* TOPPERS_CB_TYPE_ONLY */

#ifdef __cplusplus
}
#endif /* __cplusplus */
#endif /* TOPPERS_MACRO_ONLY */

#ifndef TOPPERS_CB_TYPE_ONLY

/* IDX validation macro (abbrev.) #_CVIA_# */
#define VALID_IDX(IDX)  tUartPL011_VALID_IDX(IDX)


/* cell CB macro (abbrev) #_GCBA_# */
#define GET_CELLCB(idx)  tUartPL011_GET_CELLCB(idx)

/* CELLCB type (abbrev) #_CCT_# */
#define CELLCB	tUartPL011_CB

/* celltype IDX type (abbrev) #_CTIXA_# */
#define CELLIDX	tUartPL011_IDX


/* attr access macro (abbrev) #_AAMA_# */
#define ATTR_baseAddress     tUartPL011_ATTR_baseAddress( p_cellcb )
#define ATTR_ibrd            tUartPL011_ATTR_ibrd( p_cellcb )
#define ATTR_fbrd            tUartPL011_ATTR_fbrd( p_cellcb )
#define ATTR_lcr_h           tUartPL011_ATTR_lcr_h( p_cellcb )


/* var access macro (abbrev) #_VAMA_# */
#define VAR_opened           tUartPL011_VAR_opened( p_cellcb )

/* call port function macro (abbrev) #_CPMA_# */
#define ciSIOCBR_readySend( ) \
          ((void)p_cellcb, tUartPL011_ciSIOCBR_readySend( p_cellcb ))
#define ciSIOCBR_readyReceive( ) \
          ((void)p_cellcb, tUartPL011_ciSIOCBR_readyReceive( p_cellcb ))




/* entry port function macro (abbrev) #_EPM_# */
#define eSIOPort_open    tUartPL011_eSIOPort_open
#define eSIOPort_close   tUartPL011_eSIOPort_close
#define eSIOPort_putChar tUartPL011_eSIOPort_putChar
#define eSIOPort_getChar tUartPL011_eSIOPort_getChar
#define eSIOPort_enableCBR tUartPL011_eSIOPort_enableCBR
#define eSIOPort_disableCBR tUartPL011_eSIOPort_disableCBR
#define eiISR_main       tUartPL011_eiISR_main
#define eTerminate_main  tUartPL011_eTerminate_main

/* iteration code (FOREACH_CELL) #_FEC_# */
#define FOREACH_CELL(i,p_cb)   \
    for( (i) = 0; (i) < tUartPL011_N_CELL; (i)++ ){ \
       (p_cb) = &tUartPL011_CB_tab[i];

#define END_FOREACH_CELL   }

/* CB initialize macro #_CIM_# */
#define INITIALIZE_CB(p_that)\
	(p_that)->opened = false;
#define SET_CB_INIB_POINTER(i,p_that)\
	(p_that)->_inib = &tUartPL011_INIB_tab[(i)];

#endif /* TOPPERS_CB_TYPE_ONLY */

#ifndef TOPPERS_MACRO_ONLY

#endif /* TOPPERS_MACRO_ONLY */

#endif /* tUartPL011_TECSGENH */
