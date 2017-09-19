
{ buildLispPackage, stdenv, fetchurl, lisp-project_ayah-captcha, 
   lisp_cl-who, lisp_hunchentoot, lisp_cl-json, lisp_drakma,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-who lisp_hunchentoot lisp_cl-json lisp_drakma  ];
      inherit stdenv;
      systemName = "ayah-captcha-demo";
      
      sourceProject = "${lisp-project_ayah-captcha}";
      patches = [];
      lisp_dependencies = "${lisp_cl-who} ${lisp_hunchentoot} ${lisp_cl-json} ${lisp_drakma}";
      name = "lisp_ayah-captcha-demo-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
