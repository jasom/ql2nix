
{ buildLispPackage, stdenv, fetchurl, lisp-project_trivial-raw-io, 
   lisp_alexandria,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria  ];
      inherit stdenv;
      systemName = "trivial-raw-io";
      
      sourceProject = "${lisp-project_trivial-raw-io}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria}";
      name = "lisp_trivial-raw-io-20141217-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
