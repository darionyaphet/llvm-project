; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -O0 < %s | FileCheck %s
target triple = "powerpc64le--linux-gnu"

define i1 @Test(double %a) {
; CHECK-LABEL: Test:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    xscvdpsxws 0, 1
; CHECK-NEXT:    mffprwz 3, 0
; CHECK-NEXT:    xori 3, 3, 65534
; CHECK-NEXT:    cntlzw 3, 3
; CHECK-NEXT:    srwi 4, 3, 5
; CHECK-NEXT:    # implicit-def: $x3
; CHECK-NEXT:    mr 3, 4
; CHECK-NEXT:    blr
entry:
  %conv = fptoui double %a to i16
  %cmp = icmp eq i16 %conv, -2
  ret i1 %cmp
}
