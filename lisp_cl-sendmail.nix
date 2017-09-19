
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-sendmail, 
   lisp_xmls-tools, lisp_xmls, lisp_external-program, lisp_babel-streams, lisp_cl-mime,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_xmls-tools lisp_xmls lisp_external-program lisp_babel-streams lisp_cl-mime  ];
      inherit stdenv;
      systemName = "cl-sendmail";
      
      sourceProject = "${lisp-project_cl-sendmail}";
      patches = [];
      lisp_dependencies = "${lisp_xmls-tools} ${lisp_xmls} ${lisp_external-program} ${lisp_babel-streams} ${lisp_cl-mime}";
      name = "lisp_cl-sendmail-20151218-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
