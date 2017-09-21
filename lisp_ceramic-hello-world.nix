
{ buildLispPackage, stdenv, fetchurl, lisp-project_ceramic, 
   lisp_lucerne, lisp_remote-js, lisp_clack-handler-hunchentoot, lisp_copy-directory, lisp_uuid, lisp_external-program, lisp_cl-json, lisp_electron-tools, lisp_trivial-compress, lisp_trivial-build, lisp_trivial-exe, lisp_trivial-extract, lisp_trivial-download,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_lucerne lisp_remote-js lisp_clack-handler-hunchentoot lisp_copy-directory lisp_uuid lisp_external-program lisp_cl-json lisp_electron-tools lisp_trivial-compress lisp_trivial-build lisp_trivial-exe lisp_trivial-extract lisp_trivial-download  ];
      inherit stdenv;
      systemName = "ceramic-hello-world";
      
      sourceProject = "${lisp-project_ceramic}";
      patches = [];
      lisp_dependencies = "${lisp_lucerne} ${lisp_remote-js} ${lisp_clack-handler-hunchentoot} ${lisp_copy-directory} ${lisp_uuid} ${lisp_external-program} ${lisp_cl-json} ${lisp_electron-tools} ${lisp_trivial-compress} ${lisp_trivial-build} ${lisp_trivial-exe} ${lisp_trivial-extract} ${lisp_trivial-download}";
      name = "lisp_ceramic-hello-world-20160825-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }