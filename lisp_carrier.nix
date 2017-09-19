
{ buildLispPackage, stdenv, fetchurl, lisp-project_carrier, 
  openssl,   lisp_fast-http, lisp_quri, lisp_blackbird, lisp_cl-async, lisp_fast-io, lisp_babel, lisp_alexandria,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_fast-http lisp_quri lisp_blackbird lisp_cl-async lisp_fast-io lisp_babel lisp_alexandria openssl ];
      inherit stdenv;
      systemName = "carrier";
      
      sourceProject = "${lisp-project_carrier}";
      patches = [];
      lisp_dependencies = "${lisp_fast-http} ${lisp_quri} ${lisp_blackbird} ${lisp_cl-async} ${lisp_fast-io} ${lisp_babel} ${lisp_alexandria}";
      name = "lisp_carrier-20161204-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
