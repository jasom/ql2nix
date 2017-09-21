
{ buildLispPackage, stdenv, fetchurl, lisp-project_ucw, 
   lisp_trivial-garbage, lisp_net-telent-date, lisp_rfc2109, lisp_usocket, lisp_local-time, lisp_yaclml, lisp_swank, lisp_arnesi,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_trivial-garbage lisp_net-telent-date lisp_rfc2109 lisp_usocket lisp_local-time lisp_yaclml lisp_swank lisp_arnesi  ];
      inherit stdenv;
      systemName = "ucw-core";
      
      sourceProject = "${lisp-project_ucw}";
      patches = [];
      lisp_dependencies = "${lisp_trivial-garbage} ${lisp_net-telent-date} ${lisp_rfc2109} ${lisp_usocket} ${lisp_local-time} ${lisp_yaclml} ${lisp_swank} ${lisp_arnesi}";
      name = "lisp_ucw-core-20160208-darcs";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }