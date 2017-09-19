
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-libssh2, 
  libssh2,   lisp_usocket, lisp_trivial-gray-streams, lisp_split-sequence, lisp_hu-dwim-logger, lisp_cl-fad, lisp_cffi-grovel,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_usocket lisp_trivial-gray-streams lisp_split-sequence lisp_hu-dwim-logger lisp_cl-fad lisp_cffi-grovel libssh2 ];
      inherit stdenv;
      systemName = "libssh2";
      
      sourceProject = "${lisp-project_cl-libssh2}";
      patches = [];
      lisp_dependencies = "${lisp_usocket} ${lisp_trivial-gray-streams} ${lisp_split-sequence} ${lisp_hu-dwim-logger} ${lisp_cl-fad} ${lisp_cffi-grovel}";
      name = "lisp_libssh2-20160531-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
