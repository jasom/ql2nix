
{ buildLispPackage, stdenv, fetchurl, lisp-project_dyna, 
   lisp_cl-syntax-annot, lisp_dexador, lisp_ironclad, lisp_jsown, lisp_closer-mop, lisp_sxql,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-syntax-annot lisp_dexador lisp_ironclad lisp_jsown lisp_closer-mop lisp_sxql  ];
      inherit stdenv;
      systemName = "dyna";
      
      sourceProject = "${lisp-project_dyna}";
      patches = [];
      lisp_dependencies = "${lisp_cl-syntax-annot} ${lisp_dexador} ${lisp_ironclad} ${lisp_jsown} ${lisp_closer-mop} ${lisp_sxql}";
      name = "lisp_dyna-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
