
{ buildLispPackage, stdenv, fetchurl, lisp-project_modest-config, 
   lisp_prove-asdf, lisp_prove,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_prove-asdf lisp_prove  ];
      inherit stdenv;
      systemName = "modest-config-test";
      
      sourceProject = "${lisp-project_modest-config}";
      patches = [];
      lisp_dependencies = "${lisp_prove-asdf} ${lisp_prove}";
      name = "lisp_modest-config-test-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
