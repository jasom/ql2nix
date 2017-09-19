
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-rabbit, 
  rabbitmq-c, libffi,   lisp_cl-ppcre, lisp_cffi-grovel,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ppcre lisp_cffi-grovel rabbitmq-c libffi ];
      inherit stdenv;
      systemName = "cl-rabbit";
      
      sourceProject = "${lisp-project_cl-rabbit}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ppcre} ${lisp_cffi-grovel}";
      name = "lisp_cl-rabbit-20161031-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
