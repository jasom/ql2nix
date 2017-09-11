
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-ntp-client, 
   lisp_alexandria, lisp_usocket,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_usocket  ];
      inherit stdenv;
      systemName = "cl-ntp-client";
      
      sourceProject = "${lisp-project_cl-ntp-client}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_usocket}";
      name = "lisp_cl-ntp-client-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
