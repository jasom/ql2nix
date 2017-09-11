
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-tokyo-cabinet, 
   lisp_cl-tokyo-cabinet, lisp_deoxybyte-io, lisp_deoxybyte-utilities, lisp_lift,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-tokyo-cabinet lisp_deoxybyte-io lisp_deoxybyte-utilities lisp_lift  ];
      inherit stdenv;
      systemName = "cl-tokyo-cabinet-test";
      
      sourceProject = "${lisp-project_cl-tokyo-cabinet}";
      patches = [];
      lisp_dependencies = "${lisp_cl-tokyo-cabinet} ${lisp_deoxybyte-io} ${lisp_deoxybyte-utilities} ${lisp_lift}";
      name = "lisp_cl-tokyo-cabinet-test-20160825-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }