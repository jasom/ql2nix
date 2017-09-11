
{ buildLispPackage, stdenv, fetchurl, lisp-project_s-http-server, 
   lisp_puri, lisp_s-base64, lisp_s-sysdeps, lisp_s-utils, lisp_salza2,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_puri lisp_s-base64 lisp_s-sysdeps lisp_s-utils lisp_salza2  ];
      inherit stdenv;
      systemName = "s-http-server";
      
      sourceProject = "${lisp-project_s-http-server}";
      patches = [];
      lisp_dependencies = "${lisp_puri} ${lisp_s-base64} ${lisp_s-sysdeps} ${lisp_s-utils} ${lisp_salza2}";
      name = "lisp_s-http-server-20130128-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
