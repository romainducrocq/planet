m4_ifdef(`_FRONTEND_IDENTS_M4', `', `
m4_define(`_FRONTEND_IDENTS_M4', `')m4_dnl

m4_include(`../ast/ast_t.plx.m4')m4_dnl

m4_include(`../frontend/labels.plx.m4')m4_dnl

type struc CExp;
type struc IdentifierContext;

########################################################################################################################

# Identifiers

pub fn rslv_label_identifier(ctx: *struc IdentifierContext, target: TIdentifier) TIdentifier;
pub fn rslv_var_identifier(ctx: *struc IdentifierContext, variable: TIdentifier) TIdentifier;
pub fn rslv_struct_tag(ctx: *struc IdentifierContext, structure: TIdentifier) TIdentifier;
pub fn repr_label_identifier(ctx: *struc IdentifierContext, label_kind: LABEL_KIND) TIdentifier;
pub fn repr_loop_identifier(ctx: *struc IdentifierContext, label_kind: LABEL_KIND, target: TIdentifier) TIdentifier;
pub fn repr_case_identifier(ctx: *struc IdentifierContext, target: TIdentifier, is_label: bool, i: u64) TIdentifier;
pub fn repr_var_identifier(ctx: *struc IdentifierContext, node: *struc CExp) TIdentifier;

')m4_dnl
