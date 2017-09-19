
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-paypal, 
   lisp_drakma, lisp_hunchentoot,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_drakma lisp_hunchentoot  ];
      inherit stdenv;
      systemName = "cl-paypal";
      
      sourceProject = "${lisp-project_cl-paypal}";
      patches = [];
      lisp_dependencies = "${lisp_drakma} ${lisp_hunchentoot}";
      name = "lisp_cl-paypal-20101006-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
