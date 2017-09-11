
{ buildLispPackage, stdenv, fetchurl, lisp-project_deoxybyte-systems, 
   lisp_cl-fad,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-fad  ];
      inherit stdenv;
      systemName = "deoxybyte-systems";
      
      sourceProject = "${lisp-project_deoxybyte-systems}";
      patches = [];
      lisp_dependencies = "${lisp_cl-fad}";
      name = "lisp_deoxybyte-systems-20140113-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
