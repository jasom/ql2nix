
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-str, 
   lisp_prove,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_prove  ];
      inherit stdenv;
      systemName = "str";
      
      sourceProject = "${lisp-project_cl-str}";
      patches = [];
      lisp_dependencies = "${lisp_prove}";
      name = "lisp_str-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
