
{ buildLispPackage, stdenv, fetchurl, lisp-project_lisp-unit2, 
   lisp_symbol-munger, lisp_iterate, lisp_cl-interpol, lisp_alexandria,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_symbol-munger lisp_iterate lisp_cl-interpol lisp_alexandria  ];
      inherit stdenv;
      systemName = "lisp-unit2";
      
      sourceProject = "${lisp-project_lisp-unit2}";
      patches = [];
      lisp_dependencies = "${lisp_symbol-munger} ${lisp_iterate} ${lisp_cl-interpol} ${lisp_alexandria}";
      name = "lisp_lisp-unit2-20160531-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
