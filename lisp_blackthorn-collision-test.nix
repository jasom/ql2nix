
{ buildLispPackage, stdenv, fetchurl, lisp-project_blackthorn-engine, 
   lisp_blackthorn,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_blackthorn  ];
      inherit stdenv;
      systemName = "blackthorn-collision-test";
      
      sourceProject = "${lisp-project_blackthorn-engine}";
      patches = [];
      lisp_dependencies = "${lisp_blackthorn}";
      name = "lisp_blackthorn-collision-test-20150608-hg";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
