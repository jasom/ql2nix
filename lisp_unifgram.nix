
{ buildLispPackage, stdenv, fetchurl, lisp-project_paiprolog, 
   lisp_paiprolog,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_paiprolog  ];
      inherit stdenv;
      systemName = "unifgram";
      
      sourceProject = "${lisp-project_paiprolog}";
      patches = [];
      lisp_dependencies = "${lisp_paiprolog}";
      name = "lisp_unifgram-20160421-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
