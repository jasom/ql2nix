
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-paypal, 
   lisp_cl-ppcre, lisp_drakma, lisp_hunchentoot,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ppcre lisp_drakma lisp_hunchentoot  ];
      inherit stdenv;
      systemName = "cl-paypal";
      
      sourceProject = "${lisp-project_cl-paypal}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ppcre} ${lisp_drakma} ${lisp_hunchentoot}";
      name = "lisp_cl-paypal-20101006-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
