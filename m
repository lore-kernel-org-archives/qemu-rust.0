Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C171CAC5B5
	for <qemu-rust@archiver.kernel.org>; Mon, 29 Sep 2025 15:52:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1v3G8y-0000y3-R8; Mon, 29 Sep 2025 11:50:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v3G8c-0000jC-2R
 for qemu-rust@nongnu.org; Mon, 29 Sep 2025 11:50:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v3G8O-0000K2-P5
 for qemu-rust@nongnu.org; Mon, 29 Sep 2025 11:50:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759160988;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BPzxrddqtL0TItlI5LLtoSQbI5T1+Lsx8CSDc/Du130=;
 b=CaorO2EtMOEcOdzXx1H0tGZOyK6KUhWpYmEt39vtc+x3HZAwVTOZ41Z4Qcbtc3/Rn6vfCy
 XMv7xK+13jnQxEcbzjW3uqoecNxPvNUqrc5bN/vvBj9lG44pvYtOq9Lg3wYq7wFTRzkWOd
 8CaVKoFa6ntKBRX0b7A+6NYBPZZbF7A=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-1xMWhV48PniYrOdqfLwG4Q-1; Mon, 29 Sep 2025 11:49:46 -0400
X-MC-Unique: 1xMWhV48PniYrOdqfLwG4Q-1
X-Mimecast-MFC-AGG-ID: 1xMWhV48PniYrOdqfLwG4Q_1759160986
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-b2e6b2bb443so509017466b.2
 for <qemu-rust@nongnu.org>; Mon, 29 Sep 2025 08:49:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759160985; x=1759765785;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BPzxrddqtL0TItlI5LLtoSQbI5T1+Lsx8CSDc/Du130=;
 b=k8SGd48Q6fbyjpDSJyP93UBehHRrCakSOPC0aLOqR94WdQvbnCKVNkNaiHdoOnBwrU
 cFBi4QLwMkalQ53QleTFCJz7WlYUvakooTASmTnZMzQYz+iI7pkLAyoI4SQPr2W0MFAy
 ukoEbpENloBGYl69irnR5uu6Pa8vwV9+m9rBh+2EgttwvUhxxQabnG8mPH7rhmxDMkYz
 GxClgqFl0QNUnVt0JgxUr6C/uLmHgUgN3xRGovt4YXypapTVdiyhU7F/oB7d5rJ5Owas
 3qNfOb/6LTlJPs+BQ+r3e/KaimX0+ltjUutcO9qQKdAHWmaJGjfsGIdUyDZauvAc8chI
 VKlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRiptDHxLzvHc2f5zdJINt/f1qAApUFZhZXfDdQ8lWTDdn+QHcfV8U81A/BXPjnwarfY0NHo3e4js=@nongnu.org
X-Gm-Message-State: AOJu0YzP2UI/y3u6hHzso4+CxrU2x6nvo3A9Snni5to6KJHHPc87iUwO
 xo1yijG9IIYRX9Re3yLkfwQJXEf7YeEvhLbUtaw8JQt4D68q2r5YoI4FO+ogB2HAzconI91Kf1/
 v4EGILVF3VuFtfCioxQW3W5fc81A/mYCWwSavW+2kbGXsjOBN4epFWoY=
X-Gm-Gg: ASbGncurvnA4ZsFlGXpKA9CJaBmI+9XAOtNN/ImZvfAHtgIM+eeYB9II5mEDbTyOZcx
 M6uoK0oyHdfHbpJmM0AOKujOzbcNswRjT3ZfGtfbXFLyUFNhGnJo+VdiV+I8Sjl7a5klJZebMDn
 u6X2wZurVLEpPX2kbP8m5NiTIF2ycfNBxuEkjSuN5KpzgfC1iWZNZbILc8NDG+rf+g4YvTsbVcl
 0LX2aGPpa6aXpvoXZk8FL3QNt0v0oibZMzBtddoTwXALrC1IS0q75AwmM1B4aRhZfAwc6jEPT1Y
 S6s4mopBN7GW3ruv2bn8t1snRH4cQoKcuZMcorSzSM0cSwPwOy59+HMUTrke58kXijKsctg1pHs
 KtrX1IIQkQIdNyFrytkQSA5eKSlQ4+DFBIgZcq+RRhXtzDA==
X-Received: by 2002:a17:907:6093:b0:ae1:a6a0:f2fe with SMTP id
 a640c23a62f3a-b34bad28537mr1913857566b.36.1759160985479; 
 Mon, 29 Sep 2025 08:49:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG21EHXJbWMybWv0lsGwuZFID3E8aCqbDC3DKgYJf6kzYsdtFqtEWU8jK5Bb3ncnCzjZgj+nw==
X-Received: by 2002:a17:907:6093:b0:ae1:a6a0:f2fe with SMTP id
 a640c23a62f3a-b34bad28537mr1913855166b.36.1759160985043; 
 Mon, 29 Sep 2025 08:49:45 -0700 (PDT)
Received: from [192.168.10.48] ([176.206.127.188])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b3545a983ffsm953498566b.94.2025.09.29.08.49.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Sep 2025 08:49:44 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Tanish Desai <tanishdesai37@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Mads Ynddal <mads@ynddal.dk>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Zhao Liu <zhao1.liu@intel.com>, qemu-rust@nongnu.org
Subject: [PATCH 02/16] tracetool: remove dead code
Date: Mon, 29 Sep 2025 17:49:24 +0200
Message-ID: <20250929154938.594389-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250929154938.594389-1-pbonzini@redhat.com>
References: <20250929154938.594389-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4qbcjtCa0XUTSrEt_gYEs4yc_kq-aue5DlxTOtb5hi8_1759160986
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.513,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-rust@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: QEMU Rust-related patches and discussion <qemu-rust.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-rust>
List-Post: <mailto:qemu-rust@nongnu.org>
List-Help: <mailto:qemu-rust-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=subscribe>
Errors-To: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org
Sender: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org

Remove a bunch of dead code from tracetool.

In particular, there are no tcg-exec events anymore and the sub-event
functionality was only used for it.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/tracetool/__init__.py                | 45 +++-----------------
 scripts/tracetool/format/h.py                |  5 ---
 scripts/tracetool/format/log_stap.py         |  2 -
 scripts/tracetool/format/simpletrace_stap.py |  2 -
 4 files changed, 6 insertions(+), 48 deletions(-)

diff --git a/scripts/tracetool/__init__.py b/scripts/tracetool/__init__.py
index 1d5238a0843..4ef1dc1fca3 100644
--- a/scripts/tracetool/__init__.py
+++ b/scripts/tracetool/__init__.py
@@ -15,7 +15,6 @@
 import os
 import re
 import sys
-import weakref
 from pathlib import PurePath
 
 import tracetool.backend
@@ -122,10 +121,6 @@ def __init__(self, args):
             else:
                 self._args.append(arg)
 
-    def copy(self):
-        """Create a new copy."""
-        return Arguments(list(self._args))
-
     @staticmethod
     def build(arg_str):
         """Build and Arguments instance from an argument string.
@@ -222,13 +217,12 @@ class Event(object):
                       r"(?P<name>\w+)"
                       r"\((?P<args>[^)]*)\)"
                       r"\s*"
-                      r"(?:(?:(?P<fmt_trans>\".+),)?\s*(?P<fmt>\".+))?"
+                      r"(?P<fmt>\".+)?"
                       r"\s*")
 
     _VALID_PROPS = set(["disable"])
 
-    def __init__(self, name, props, fmt, args, lineno, filename, orig=None,
-                 event_trans=None, event_exec=None):
+    def __init__(self, name, props, fmt, args, lineno, filename):
         """
         Parameters
         ----------
@@ -236,20 +230,14 @@ def __init__(self, name, props, fmt, args, lineno, filename, orig=None,
             Event name.
         props : list of str
             Property names.
-        fmt : str, list of str
-            Event printing format string(s).
+        fmt : str
+            Event printing format string.
         args : Arguments
             Event arguments.
         lineno : int
             The line number in the input file.
         filename : str
             The path to the input file.
-        orig : Event or None
-            Original Event before transformation/generation.
-        event_trans : Event or None
-            Generated translation-time event ("tcg" property).
-        event_exec : Event or None
-            Generated execution-time event ("tcg" property).
 
         """
         self.name = name
@@ -258,29 +246,16 @@ def __init__(self, name, props, fmt, args, lineno, filename, orig=None,
         self.args = args
         self.lineno = int(lineno)
         self.filename = str(filename)
-        self.event_trans = event_trans
-        self.event_exec = event_exec
 
         if len(args) > 10:
             raise ValueError("Event '%s' has more than maximum permitted "
                              "argument count" % name)
 
-        if orig is None:
-            self.original = weakref.ref(self)
-        else:
-            self.original = orig
-
         unknown_props = set(self.properties) - self._VALID_PROPS
         if len(unknown_props) > 0:
             raise ValueError("Unknown properties: %s"
                              % ", ".join(unknown_props))
-        assert isinstance(self.fmt, str) or len(self.fmt) == 2
 
-    def copy(self):
-        """Create a new copy."""
-        return Event(self.name, list(self.properties), self.fmt,
-                     self.args.copy(), self.lineno, self.filename,
-                     self, self.event_trans, self.event_exec)
 
     @staticmethod
     def build(line_str, lineno, filename):
@@ -302,8 +277,7 @@ def build(line_str, lineno, filename):
         name = groups["name"]
         props = groups["props"].split()
         fmt = groups["fmt"]
-        fmt_trans = groups["fmt_trans"]
-        if fmt.find("%m") != -1 or fmt_trans.find("%m") != -1:
+        if fmt.find("%m") != -1:
             raise ValueError("Event format '%m' is forbidden, pass the error "
                              "as an explicit trace argument")
         if fmt.endswith(r'\n"'):
@@ -312,29 +286,22 @@ def build(line_str, lineno, filename):
         if '\\n' in fmt:
             raise ValueError("Event format must not use new line character")
 
-        if len(fmt_trans) > 0:
-            fmt = [fmt_trans, fmt]
         args = Arguments.build(groups["args"])
 
         return Event(name, props, fmt, args, lineno, posix_relpath(filename))
 
     def __repr__(self):
         """Evaluable string representation for this object."""
-        if isinstance(self.fmt, str):
-            fmt = self.fmt
-        else:
-            fmt = "%s, %s" % (self.fmt[0], self.fmt[1])
         return "Event('%s %s(%s) %s')" % (" ".join(self.properties),
                                           self.name,
                                           self.args,
-                                          fmt)
+                                          self.fmt)
     # Star matching on PRI is dangerous as one might have multiple
     # arguments with that format, hence the non-greedy version of it.
     _FMT = re.compile(r"(%[\d\.]*\w+|%.*?PRI\S+)")
 
     def formats(self):
         """List conversion specifiers in the argument print format string."""
-        assert not isinstance(self.fmt, list)
         return self._FMT.findall(self.fmt)
 
     QEMU_TRACE               = "trace_%(name)s"
diff --git a/scripts/tracetool/format/h.py b/scripts/tracetool/format/h.py
index b42a8268a81..bd9e0ca7f23 100644
--- a/scripts/tracetool/format/h.py
+++ b/scripts/tracetool/format/h.py
@@ -40,11 +40,6 @@ def generate(events, backend, group):
             enabled = 0
         else:
             enabled = 1
-        if "tcg-exec" in e.properties:
-            # a single define for the two "sub-events"
-            out('#define TRACE_%(name)s_ENABLED %(enabled)d',
-                name=e.original.name.upper(),
-                enabled=enabled)
         out('#define TRACE_%s_ENABLED %d' % (e.name.upper(), enabled))
 
     backend.generate_begin(events, group)
diff --git a/scripts/tracetool/format/log_stap.py b/scripts/tracetool/format/log_stap.py
index 710d62bffe4..5b1bbe907ff 100644
--- a/scripts/tracetool/format/log_stap.py
+++ b/scripts/tracetool/format/log_stap.py
@@ -18,8 +18,6 @@
 from tracetool.backend.simple import is_string
 from tracetool.format.stap import stap_escape
 
-def global_var_name(name):
-    return probeprefix().replace(".", "_") + "_" + name
 
 STATE_SKIP = 0
 STATE_LITERAL = 1
diff --git a/scripts/tracetool/format/simpletrace_stap.py b/scripts/tracetool/format/simpletrace_stap.py
index 72971133bf0..ac39a492d96 100644
--- a/scripts/tracetool/format/simpletrace_stap.py
+++ b/scripts/tracetool/format/simpletrace_stap.py
@@ -17,8 +17,6 @@
 from tracetool.backend.simple import is_string
 from tracetool.format.stap import stap_escape
 
-def global_var_name(name):
-    return probeprefix().replace(".", "_") + "_" + name
 
 def generate(events, backend, group):
     out('/* This file is autogenerated by tracetool, do not edit. */',
-- 
2.51.0


