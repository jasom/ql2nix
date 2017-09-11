
{ buildLispPackage, stdenv, fetchurl, lisp-project_deoxybyte-io, 
   lisp_cl-fad, lisp_deoxybyte-systems, lisp_deoxybyte-utilities, lisp_getopt,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-fad lisp_deoxybyte-systems lisp_deoxybyte-utilities lisp_getopt  ];
      inherit stdenv;
      systemName = "deoxybyte-io";
      
      sourceProject = "${lisp-project_deoxybyte-io}";
      patches = [];
      lisp_dependencies = "${lisp_cl-fad} ${lisp_deoxybyte-systems} ${lisp_deoxybyte-utilities} ${lisp_getopt}";
      name = "lisp_deoxybyte-io-20140113-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
