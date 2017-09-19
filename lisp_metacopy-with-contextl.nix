
{ buildLispPackage, stdenv, fetchurl, lisp-project_metacopy, 
   lisp_contextl, lisp_moptilities,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_contextl lisp_moptilities  ];
      inherit stdenv;
      systemName = "metacopy-with-contextl";
      
      sourceProject = "${lisp-project_metacopy}";
      patches = [];
      lisp_dependencies = "${lisp_contextl} ${lisp_moptilities}";
      name = "lisp_metacopy-with-contextl-20170403-darcs";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
