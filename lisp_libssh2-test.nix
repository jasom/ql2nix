
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-libssh2, 
   lisp_hu-dwim-stefil, lisp_libssh2,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_hu-dwim-stefil lisp_libssh2  ];
      inherit stdenv;
      systemName = "libssh2.test";
      
      sourceProject = "${lisp-project_cl-libssh2}";
      patches = [];
      lisp_dependencies = "${lisp_hu-dwim-stefil} ${lisp_libssh2}";
      name = "lisp_libssh2-test-20160531-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
