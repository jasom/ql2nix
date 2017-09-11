
{ buildLispPackage, stdenv, fetchurl, lisp-project_deoxybyte-utilities, 
   lisp_deoxybyte-systems,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_deoxybyte-systems  ];
      inherit stdenv;
      systemName = "deoxybyte-utilities";
      
      sourceProject = "${lisp-project_deoxybyte-utilities}";
      patches = [];
      lisp_dependencies = "${lisp_deoxybyte-systems}";
      name = "lisp_deoxybyte-utilities-20140113-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
