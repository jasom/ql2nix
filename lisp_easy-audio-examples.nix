
{ buildLispPackage, stdenv, fetchurl, lisp-project_easy-audio, 
   lisp_easy-audio,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_easy-audio  ];
      inherit stdenv;
      systemName = "easy-audio-examples";
      
      sourceProject = "${lisp-project_easy-audio}";
      patches = [];
      lisp_dependencies = "${lisp_easy-audio}";
      name = "lisp_easy-audio-examples-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
