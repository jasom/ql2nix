
{ buildLispPackage, stdenv, fetchurl, lisp-project_ayah-captcha, 
   lisp_ayah-captcha, lisp_hunchentoot, lisp_cl-who,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_ayah-captcha lisp_hunchentoot lisp_cl-who  ];
      inherit stdenv;
      systemName = "ayah-captcha-demo";
      
      sourceProject = "${lisp-project_ayah-captcha}";
      patches = [];
      lisp_dependencies = "${lisp_ayah-captcha} ${lisp_hunchentoot} ${lisp_cl-who}";
      name = "lisp_ayah-captcha-demo-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
