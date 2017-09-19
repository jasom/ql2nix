
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-ntp-client, 
   lisp_usocket, lisp_alexandria,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_usocket lisp_alexandria  ];
      inherit stdenv;
      systemName = "cl-ntp-client";
      
      sourceProject = "${lisp-project_cl-ntp-client}";
      patches = [];
      lisp_dependencies = "${lisp_usocket} ${lisp_alexandria}";
      name = "lisp_cl-ntp-client-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
