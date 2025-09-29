Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3044CCAC5B9
	for <qemu-rust@archiver.kernel.org>; Mon, 29 Sep 2025 15:51:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1v3G9E-000143-5y; Mon, 29 Sep 2025 11:50:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v3G8n-0000pB-8r
 for qemu-rust@nongnu.org; Mon, 29 Sep 2025 11:50:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v3G8V-0000LK-2B
 for qemu-rust@nongnu.org; Mon, 29 Sep 2025 11:50:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759160996;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kjND0aUj9KRlLexwJ1p+kxgUGn2cNQpl2JPdVKoLLh0=;
 b=dVIYMCcmm+PtIVOhRoNdYYrRnFyNFkgsbCi00e2M7ph8wEY2R7sE5hIaXo+enErXnaKdOj
 Bh20HaFUxNqplk1ytQNzLvUca9ZVoq6f3kzjqTm9sG7OOo4JktT0NnbYb6wBHzNK1CQSED
 ANyUVbi6PLRXdYQPkBPOIXd09dcqTVY=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-94-uaUWY9z8PSmYgXZCLW--jw-1; Mon, 29 Sep 2025 11:49:55 -0400
X-MC-Unique: uaUWY9z8PSmYgXZCLW--jw-1
X-Mimecast-MFC-AGG-ID: uaUWY9z8PSmYgXZCLW--jw_1759160994
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-b335fbe7c0dso589548266b.1
 for <qemu-rust@nongnu.org>; Mon, 29 Sep 2025 08:49:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759160994; x=1759765794;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kjND0aUj9KRlLexwJ1p+kxgUGn2cNQpl2JPdVKoLLh0=;
 b=nr9v4n3VVqojgIvin7fYZEOEKfTCyuKCAl8kjV+bbHWYp7wsBdHssKhZwdaevfP3Mm
 +XJr4qnzsadX8eqXVBSNUmpBJV04blgNBywDLGUKpbNd1xAbeKJU0LtncRzDa9JsWS1C
 zZUtYGeQXhmrT9DdQG8Ey/kYFn/ahpiDm2O8INlaDSRk2DIaYSTYebrCFkK+cfLksgQd
 zW9aU7SUwjGH7oKDj3iDfpwTUxz6ElctK0sd8MAcfbBeFOYpzJFyekr7SUhL6PqbNvJQ
 UzCA9B6+oD24xoIgWXXF0WNj5VZck1ja4nIX/EO6bMvNqSHpKn7iOsw0gU6aF3kAOU1q
 lXxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVa+u0YrWY5/UPu/JVDvYVD/fsRGArntOF1bxtvhoFxFcG4PSLE3cZGVJi88DAD/VJwVdoz/XMh0ok=@nongnu.org
X-Gm-Message-State: AOJu0Yx7iV6q0iVi3SZ4+TGH6xbTnJmOa1y21fCr61IMCaP88TU/7k1G
 LETd4CQ5LFuUWNGvxy+ZTcZ4AhdrLJ+tfA4eRlhdWHT1aG7ixAI45KFF95G0g/MclpJDdxRaWxb
 VuJ0NZ1OZ70yTJY6ja28zf6pVMK1wxiIoOIJd/nRxgT+xMyala9MuNbU=
X-Gm-Gg: ASbGnctajygZSO4w5Q2FED1SCpDRRsXP86zzy0Zm62+pjq6JNN4DZw1fvet+1Ewq/TE
 uJoul5m07F8vgjb5JzpBa5eVd4PKHIHtaP1y6IiKMEBSR5MPzws3tnUueql+XUmD7LvbqCUCxDu
 ewPWDnWZTgXmlyMgfO7jXvk8XKeJgW21pkURu4kF8ZkNpTpj5xZoX9CTy4T0qpFttcqR/358VfL
 nlDZoDOuiTPVNW9/p/32uBkxtM5RTtieQXzEzL1GBLEld0d21DuPezESTAdOdyeTmEfkmceK322
 3ucHp2gO/xS1bqwEzE4xFdieTsiuwqKOnHzYzVLEWE1/e/T7fhyjwqL47quXH1L6AdcUJMbFLdK
 FDIQGKLebMihwEPvQnvTqDcFZUOuHbjpKXa1rh+XL/NIINw==
X-Received: by 2002:a17:907:9719:b0:b04:1957:8e72 with SMTP id
 a640c23a62f3a-b34bd053b67mr1751122766b.65.1759160993953; 
 Mon, 29 Sep 2025 08:49:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGKO9VryLhKU504aYLxA60cVWk4YbnI4yzk6F9rOZvT0rFxzsDRodNbJ93yIEvGPTluvssMZw==
X-Received: by 2002:a17:907:9719:b0:b04:1957:8e72 with SMTP id
 a640c23a62f3a-b34bd053b67mr1751120366b.65.1759160993538; 
 Mon, 29 Sep 2025 08:49:53 -0700 (PDT)
Received: from [192.168.10.48] ([176.206.127.188])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b3ae61b7260sm490844766b.48.2025.09.29.08.49.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Sep 2025 08:49:51 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Tanish Desai <tanishdesai37@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Mads Ynddal <mads@ynddal.dk>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Zhao Liu <zhao1.liu@intel.com>, qemu-rust@nongnu.org
Subject: [PATCH 05/16] trace/ftrace: move snprintf+write from tracepoints to
 ftrace.c
Date: Mon, 29 Sep 2025 17:49:27 +0200
Message-ID: <20250929154938.594389-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250929154938.594389-1-pbonzini@redhat.com>
References: <20250929154938.594389-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SpCBGu0AHF0MJzaPIqPtPpXDRjhmK1G9AI13vqlAELo_1759160994
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
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

This simplifies the Python code and reduces the size of the tracepoints.

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/tracetool/ftrace.h            | 28 ++++++----------------------
 trace/ftrace.h                      |  1 +
 trace/ftrace.c                      | 15 +++++++++++++++
 scripts/tracetool/backend/ftrace.py | 12 ++----------
 4 files changed, 24 insertions(+), 32 deletions(-)

diff --git a/tests/tracetool/ftrace.h b/tests/tracetool/ftrace.h
index fe22ea0f09f..1dfe4239413 100644
--- a/tests/tracetool/ftrace.h
+++ b/tests/tracetool/ftrace.h
@@ -21,18 +21,10 @@ extern uint16_t _TRACE_TEST_WIBBLE_DSTATE;
 
 static inline void trace_test_blah(void *context, const char *filename)
 {
-    {
-        char ftrace_buf[MAX_TRACE_STRLEN];
-        int unused __attribute__ ((unused));
-        int trlen;
-        if (trace_event_get_state(TRACE_TEST_BLAH)) {
+    if (trace_event_get_state(TRACE_TEST_BLAH)) {
 #line 4 "trace-events"
-            trlen = snprintf(ftrace_buf, MAX_TRACE_STRLEN,
-                             "test_blah " "Blah context=%p filename=%s" "\n" , context, filename);
-#line 33 "ftrace.h"
-            trlen = MIN(trlen, MAX_TRACE_STRLEN - 1);
-            unused = write(trace_marker_fd, ftrace_buf, trlen);
-        }
+        ftrace_write("test_blah " "Blah context=%p filename=%s" "\n" , context, filename);
+#line 28 "ftrace.h"
     }
 }
 
@@ -42,18 +34,10 @@ static inline void trace_test_blah(void *context, const char *filename)
 
 static inline void trace_test_wibble(void *context, int value)
 {
-    {
-        char ftrace_buf[MAX_TRACE_STRLEN];
-        int unused __attribute__ ((unused));
-        int trlen;
-        if (trace_event_get_state(TRACE_TEST_WIBBLE)) {
+    if (trace_event_get_state(TRACE_TEST_WIBBLE)) {
 #line 5 "trace-events"
-            trlen = snprintf(ftrace_buf, MAX_TRACE_STRLEN,
-                             "test_wibble " "Wibble context=%p value=%d" "\n" , context, value);
-#line 54 "ftrace.h"
-            trlen = MIN(trlen, MAX_TRACE_STRLEN - 1);
-            unused = write(trace_marker_fd, ftrace_buf, trlen);
-        }
+        ftrace_write("test_wibble " "Wibble context=%p value=%d" "\n" , context, value);
+#line 41 "ftrace.h"
     }
 }
 #endif /* TRACE_TESTSUITE_GENERATED_TRACERS_H */
diff --git a/trace/ftrace.h b/trace/ftrace.h
index cb5e35d2171..16c122816d1 100644
--- a/trace/ftrace.h
+++ b/trace/ftrace.h
@@ -8,5 +8,6 @@
 extern int trace_marker_fd;
 
 bool ftrace_init(void);
+G_GNUC_PRINTF(1, 2) void ftrace_write(const char *fmt, ...);
 
 #endif /* TRACE_FTRACE_H */
diff --git a/trace/ftrace.c b/trace/ftrace.c
index 9749543d9b2..6875faedb9c 100644
--- a/trace/ftrace.c
+++ b/trace/ftrace.c
@@ -38,6 +38,21 @@ static int find_mount(char *mount_point, const char *fstype)
     return ret;
 }
 
+void ftrace_write(const char *fmt, ...)
+{
+    char ftrace_buf[MAX_TRACE_STRLEN];
+    int unused __attribute__ ((unused));
+    int trlen;
+    va_list ap;
+
+    va_start(ap, fmt);
+    trlen = vsnprintf(ftrace_buf, MAX_TRACE_STRLEN, fmt, ap);
+    va_end(ap);
+
+    trlen = MIN(trlen, MAX_TRACE_STRLEN - 1);
+    unused = write(trace_marker_fd, ftrace_buf, trlen);
+}
+
 bool ftrace_init(void)
 {
     char mount_point[PATH_MAX];
diff --git a/scripts/tracetool/backend/ftrace.py b/scripts/tracetool/backend/ftrace.py
index a14aafcee62..8c0ce3f23a0 100644
--- a/scripts/tracetool/backend/ftrace.py
+++ b/scripts/tracetool/backend/ftrace.py
@@ -28,18 +28,10 @@ def generate_h(event, group):
     if len(event.args) > 0:
         argnames = ", " + argnames
 
-    out('    {',
-        '        char ftrace_buf[MAX_TRACE_STRLEN];',
-        '        int unused __attribute__ ((unused));',
-        '        int trlen;',
-        '        if (trace_event_get_state(%(event_id)s)) {',
+    out('    if (trace_event_get_state(%(event_id)s)) {',
         '#line %(event_lineno)d "%(event_filename)s"',
-        '            trlen = snprintf(ftrace_buf, MAX_TRACE_STRLEN,',
-        '                             "%(name)s " %(fmt)s "\\n" %(argnames)s);',
+        '        ftrace_write("%(name)s " %(fmt)s "\\n" %(argnames)s);',
         '#line %(out_next_lineno)d "%(out_filename)s"',
-        '            trlen = MIN(trlen, MAX_TRACE_STRLEN - 1);',
-        '            unused = write(trace_marker_fd, ftrace_buf, trlen);',
-        '        }',
         '    }',
         name=event.name,
         args=event.args,
-- 
2.51.0


