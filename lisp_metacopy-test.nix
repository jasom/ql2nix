
{ buildLispPackage, stdenv, fetchurl, lisp-project_metacopy, 
   lisp_lift, lisp_metacopy,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_lift lisp_metacopy  ];
      inherit stdenv;
      systemName = "metacopy/test";
      
      sourceProject = "${lisp-project_metacopy}";
      patches = [];
      lisp_dependencies = "${lisp_lift} ${lisp_metacopy}";
      name = "lisp_metacopy-test-20170403-darcs";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
