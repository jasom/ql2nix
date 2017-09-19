
{ buildLispPackage, stdenv, fetchurl, lisp-project_dynamic-mixins, 
   lisp_closer-mop, lisp_alexandria,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_closer-mop lisp_alexandria  ];
      inherit stdenv;
      systemName = "dynamic-mixins";
      
      sourceProject = "${lisp-project_dynamic-mixins}";
      patches = [];
      lisp_dependencies = "${lisp_closer-mop} ${lisp_alexandria}";
      name = "lisp_dynamic-mixins-20141106-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
