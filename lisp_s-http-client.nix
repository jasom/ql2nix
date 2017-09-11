
{ buildLispPackage, stdenv, fetchurl, lisp-project_s-http-client, 
   lisp_chipz, lisp_puri, lisp_s-base64, lisp_s-sysdeps, lisp_s-utils,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_chipz lisp_puri lisp_s-base64 lisp_s-sysdeps lisp_s-utils  ];
      inherit stdenv;
      systemName = "s-http-client";
      
      sourceProject = "${lisp-project_s-http-client}";
      patches = [];
      lisp_dependencies = "${lisp_chipz} ${lisp_puri} ${lisp_s-base64} ${lisp_s-sysdeps} ${lisp_s-utils}";
      name = "lisp_s-http-client-20151031-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
