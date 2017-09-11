
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-str, 
   lisp_cl-ppcre, lisp_prove,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ppcre lisp_prove  ];
      inherit stdenv;
      systemName = "str";
      
      sourceProject = "${lisp-project_cl-str}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ppcre} ${lisp_prove}";
      name = "lisp_str-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
