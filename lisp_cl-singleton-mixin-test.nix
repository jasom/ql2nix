
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-singleton-mixin, 
   lisp_cl-singleton-mixin, lisp_fiveam,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-singleton-mixin lisp_fiveam  ];
      inherit stdenv;
      systemName = "cl-singleton-mixin-test";
      
      sourceProject = "${lisp-project_cl-singleton-mixin}";
      patches = [];
      lisp_dependencies = "${lisp_cl-singleton-mixin} ${lisp_fiveam}";
      name = "lisp_cl-singleton-mixin-test-20150505-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
