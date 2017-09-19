
{ buildLispPackage, stdenv, fetchurl, lisp-project_lake, 
   lisp_cl-syntax-interpol, lisp_split-sequence, lisp_lparallel, lisp_alexandria,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-syntax-interpol lisp_split-sequence lisp_lparallel lisp_alexandria  ];
      inherit stdenv;
      systemName = "lake";
      
      sourceProject = "${lisp-project_lake}";
      patches = [];
      lisp_dependencies = "${lisp_cl-syntax-interpol} ${lisp_split-sequence} ${lisp_lparallel} ${lisp_alexandria}";
      name = "lisp_lake-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
