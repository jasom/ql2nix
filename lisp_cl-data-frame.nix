
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-data-frame, 
   lisp_alexandria, lisp_anaphora, lisp_array-operations, lisp_cl-num-utils, lisp_cl-slice, lisp_let-plus,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_anaphora lisp_array-operations lisp_cl-num-utils lisp_cl-slice lisp_let-plus  ];
      inherit stdenv;
      systemName = "cl-data-frame";
      
      sourceProject = "${lisp-project_cl-data-frame}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_anaphora} ${lisp_array-operations} ${lisp_cl-num-utils} ${lisp_cl-slice} ${lisp_let-plus}";
      name = "lisp_cl-data-frame-20140713-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
