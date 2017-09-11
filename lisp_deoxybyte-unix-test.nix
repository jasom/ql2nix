
{ buildLispPackage, stdenv, fetchurl, lisp-project_deoxybyte-unix, 
   lisp_deoxybyte-unix, lisp_lift,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_deoxybyte-unix lisp_lift  ];
      inherit stdenv;
      systemName = "deoxybyte-unix-test";
      
      sourceProject = "${lisp-project_deoxybyte-unix}";
      patches = [];
      lisp_dependencies = "${lisp_deoxybyte-unix} ${lisp_lift}";
      name = "lisp_deoxybyte-unix-test-20140113-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
