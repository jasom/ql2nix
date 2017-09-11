
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-sendmail, 
   lisp_babel-streams, lisp_cl-base64, lisp_cl-mime, lisp_cl-qprint, lisp_external-program, lisp_trivial-gray-streams, lisp_xmls, lisp_xmls-tools,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_babel-streams lisp_cl-base64 lisp_cl-mime lisp_cl-qprint lisp_external-program lisp_trivial-gray-streams lisp_xmls lisp_xmls-tools  ];
      inherit stdenv;
      systemName = "cl-sendmail";
      
      sourceProject = "${lisp-project_cl-sendmail}";
      patches = [];
      lisp_dependencies = "${lisp_babel-streams} ${lisp_cl-base64} ${lisp_cl-mime} ${lisp_cl-qprint} ${lisp_external-program} ${lisp_trivial-gray-streams} ${lisp_xmls} ${lisp_xmls-tools}";
      name = "lisp_cl-sendmail-20151218-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
