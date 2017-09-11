
{ buildLispPackage, stdenv, fetchurl, lisp-project_ayah-captcha, 
   lisp_drakma, lisp_cl-json,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_drakma lisp_cl-json  ];
      inherit stdenv;
      systemName = "ayah-captcha";
      
      sourceProject = "${lisp-project_ayah-captcha}";
      patches = [];
      lisp_dependencies = "${lisp_drakma} ${lisp_cl-json}";
      name = "lisp_ayah-captcha-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
