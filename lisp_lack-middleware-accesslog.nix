
{ buildLispPackage, stdenv, fetchurl, lisp-project_lack, 
   lisp_lack-util, lisp_local-time,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_lack-util lisp_local-time  ];
      inherit stdenv;
      systemName = "lack-middleware-accesslog";
      
      sourceProject = "${lisp-project_lack}";
      patches = [];
      lisp_dependencies = "${lisp_lack-util} ${lisp_local-time}";
      name = "lisp_lack-middleware-accesslog-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
