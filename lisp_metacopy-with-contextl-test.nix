
{ buildLispPackage, stdenv, fetchurl, lisp-project_metacopy, 
   lisp_lift, lisp_metacopy, lisp_metacopy-with-contextl,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_lift lisp_metacopy lisp_metacopy-with-contextl  ];
      inherit stdenv;
      systemName = "metacopy-with-contextl/test";
      
      sourceProject = "${lisp-project_metacopy}";
      patches = [];
      lisp_dependencies = "${lisp_lift} ${lisp_metacopy} ${lisp_metacopy-with-contextl}";
      name = "lisp_metacopy-with-contextl-test-20170403-darcs";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
