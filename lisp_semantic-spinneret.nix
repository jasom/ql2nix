
{ buildLispPackage, stdenv, fetchurl, lisp-project_semantic-spinneret, 
   lisp_spinneret, lisp_alexandria,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_spinneret lisp_alexandria  ];
      inherit stdenv;
      systemName = "semantic-spinneret";
      
      sourceProject = "${lisp-project_semantic-spinneret}";
      patches = [];
      lisp_dependencies = "${lisp_spinneret} ${lisp_alexandria}";
      name = "lisp_semantic-spinneret-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
