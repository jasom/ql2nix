
{ buildLispPackage, stdenv, fetchurl, lisp-project_deoxybyte-io, 
   lisp_deoxybyte-io, lisp_lift,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_deoxybyte-io lisp_lift  ];
      inherit stdenv;
      systemName = "deoxybyte-io-test";
      
      sourceProject = "${lisp-project_deoxybyte-io}";
      patches = [];
      lisp_dependencies = "${lisp_deoxybyte-io} ${lisp_lift}";
      name = "lisp_deoxybyte-io-test-20140113-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
