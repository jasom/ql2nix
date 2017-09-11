
{ buildLispPackage, stdenv, fetchurl, lisp-project_metacopy, 
   lisp_moptilities,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_moptilities  ];
      inherit stdenv;
      systemName = "metacopy";
      
      sourceProject = "${lisp-project_metacopy}";
      patches = [];
      lisp_dependencies = "${lisp_moptilities}";
      name = "lisp_metacopy-20170403-darcs";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
