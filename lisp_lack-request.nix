
{ buildLispPackage, stdenv, fetchurl, lisp-project_lack, 
   lisp_circular-streams, lisp_cl-ppcre, lisp_http-body, lisp_quri,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_circular-streams lisp_cl-ppcre lisp_http-body lisp_quri  ];
      inherit stdenv;
      systemName = "lack-request";
      
      sourceProject = "${lisp-project_lack}";
      patches = [];
      lisp_dependencies = "${lisp_circular-streams} ${lisp_cl-ppcre} ${lisp_http-body} ${lisp_quri}";
      name = "lisp_lack-request-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
