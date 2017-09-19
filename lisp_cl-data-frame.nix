
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-data-frame, 
   lisp_cl-num-utils, lisp_array-operations, lisp_anaphora, lisp_alexandria,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-num-utils lisp_array-operations lisp_anaphora lisp_alexandria  ];
      inherit stdenv;
      systemName = "cl-data-frame";
      
      sourceProject = "${lisp-project_cl-data-frame}";
      patches = [];
      lisp_dependencies = "${lisp_cl-num-utils} ${lisp_array-operations} ${lisp_anaphora} ${lisp_alexandria}";
      name = "lisp_cl-data-frame-20140713-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
