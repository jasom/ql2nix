
{ buildLispPackage, stdenv, fetchurl, lisp-project_trivial-battery, 
   lisp_split-sequence,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_split-sequence  ];
      inherit stdenv;
      systemName = "trivial-battery";
      
      sourceProject = "${lisp-project_trivial-battery}";
      patches = [];
      lisp_dependencies = "${lisp_split-sequence}";
      name = "lisp_trivial-battery-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
