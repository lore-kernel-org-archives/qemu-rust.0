Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1texdt-00047y-UU
	for mharc-qemu-rust@gnu.org; Mon, 03 Feb 2025 09:41:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1texdT-0003ik-Rh
 for qemu-rust@nongnu.org; Mon, 03 Feb 2025 09:41:18 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1texdE-0002Qn-HA
 for qemu-rust@nongnu.org; Mon, 03 Feb 2025 09:41:15 -0500
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-aaf900cc7fbso970374166b.3
 for <qemu-rust@nongnu.org>; Mon, 03 Feb 2025 06:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738593659; x=1739198459; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DNmUeNVqLMWnKw5VpxIg7HB3Zjmh6ElltpcE7zlO/sI=;
 b=qaWAs1id5oc0k+rIsPeBbxyvOV13fuiVqJVROMSZB0Lb44lr8Y2Xs75qAVbH2Oc1lY
 Vr8Vg/3PdTsuplHxgt6YxLgRb+h210YtsGbaU+Msoqa/nr5Tkh/2bhxhzXPk5x8BveS0
 58CNPmAE/Q1ec6u+pCIWyw5v4pdg9ssa9DD5pn41hHPN6rbBmYvJ+2Kub21PQecSA4rE
 8tzwTs9r/nxfzVVu0WQIdc1Ud+QTg1eVPwl4fY7vo7ixFUDfJBSjsye3qSLToAv6KpOm
 MujfGLUdRVFPmxk8a1pj6HHYXZB69gJXi4yJn76Kuud34fDLagvGGRzITp3cRv2R+BAu
 rjDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738593659; x=1739198459;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DNmUeNVqLMWnKw5VpxIg7HB3Zjmh6ElltpcE7zlO/sI=;
 b=vWTz+c7LHokcfo21z+ieL6vj4h70nboG3KbWX6jmaCZc+K9xXxz6oVOhPFyeyJaQTa
 VLkEA267IiUI+3BekybrXfMxMDM8dfCAnawsRKpiEHZtrVtUb40sO78HqyZs+ooGa/Au
 WEJbpC5yeFTHU+vKBf+TRXL7TWkkCJk9utV+1xqImrZpCvpJdj9PSba1AcLfjxULQhWX
 laCQIzPFaUiX+1nxkTPJA9gDO7jypc1bSdIprCWOyRAHHM2fA1SLpubGCwBeFmD+e5wN
 Xt0nOOutm8Qgq4zCvaGlHpCmiQLSTGwsNtyo5L4SfYIOCfxYQEAjgK20nGhKTvbBQkUP
 ARLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9mcgtmSO3Y+4Fa/7rlyNAQR3KqNvm9V8bakeW3flzbhOFF79BKzp6oOO+2ylhpMxdLzYtB4wVcJ4=@nongnu.org
X-Gm-Message-State: AOJu0Ywvrc2FkScv9+ykNep0UO+37pEXKnUOy/02CVYnSJ2Gt3kFZc3B
 /+6XuOImwNOnHy1IlRwG3SUW/BT2DroF0n/AiO+otI1EMRmMN17QwEBg5VW/M+4=
X-Gm-Gg: ASbGncv6hfg2lwOCMfV4FGSHReX1CFOOptKgqPQcoqpAYUI8GBZ9VytxdsKe1XuRVl8
 pUFevSdGdzDAEsGeYSV6jk2lt68KhHFkhKd6KPj3+L584sfLAURDpD5rAXuSakrjnA7R7GISicV
 dfqYQRbzpTB2uL9hC2KvzH32StjaQqDIKhOs17dfxnMeKf6k935ZEFziS5V6KWlynh7AA9B8VXK
 izlZGoED6E5Ubn+uxcwhipjOESVYBM97X/E66pcdOSC6PDRzywo3gTaTGO/AkYQiJ840LxDXn81
 6GvtNIvIWnuM4W3FDw==
X-Google-Smtp-Source: AGHT+IERc32Yfp0Ol9MGOsgKzyZPwb4uj3aFdLp1icKl6wSJpAi9oq7kRr25owzUkCJZa2ih6KGhMw==
X-Received: by 2002:a17:906:e218:b0:ab6:dd6b:2a3 with SMTP id
 a640c23a62f3a-ab6dd6b0549mr1789421266b.22.1738593658893; 
 Mon, 03 Feb 2025 06:40:58 -0800 (PST)
Received: from draig.lan ([185.126.160.109]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6e4a57181sm768648166b.170.2025.02.03.06.40.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2025 06:40:57 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 356195FA5E;
 Mon,  3 Feb 2025 14:40:50 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Thomas Huth <thuth@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Hao Wu <wuhaotsh@google.com>, Peter Xu <peterx@redhat.com>,
 Warner Losh <imp@bsdimp.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-arm@nongnu.org,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Kyle Evans <kevans@freebsd.org>,
 Laurent Vivier <laurent@vivier.eu>, Riku Voipio <riku.voipio@iki.fi>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-rust@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liwei1518@gmail.com>,
 qemu-riscv@nongnu.org, Fabiano Rosas <farosas@suse.de>,
 Tyrone Ting <kfting@nuvoton.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 15/18] gdbstub: Allow late attachment
Date: Mon,  3 Feb 2025 14:40:45 +0000
Message-Id: <20250203144048.2131117-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250203144048.2131117-1-alex.bennee@linaro.org>
References: <20250203144048.2131117-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 03 Feb 2025 14:41:19 -0000

From: Ilya Leoshkevich <iii@linux.ibm.com>

Allow debugging individual processes in multi-process applications by
starting them with export QEMU_GDB=/tmp/qemu-%d.sock,suspend=n.
Currently one would have to attach to every process to ensure the app
makes progress.

In case suspend=n is not specified, the flow remains unchanged. If it
is specified, then accepting the client connection is delegated to a
thread. In the future this machinery may be reused for handling
reconnections and interruptions.

On accepting a connection, the thread schedules gdb_handlesig() on the
first CPU and wakes it up with host_interrupt_signal. Note that the
result of this gdb_handlesig() invocation is handled, as opposed to
many other existing call sites. These other call sites probably need to
be fixed separately.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Message-Id: <20250117001542.8290-7-iii@linux.ibm.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 bsd-user/main.c   |   1 -
 gdbstub/user.c    | 115 +++++++++++++++++++++++++++++++++++++++++-----
 linux-user/main.c |   1 -
 3 files changed, 103 insertions(+), 14 deletions(-)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index b2f6a9be2f..fdb160bed0 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -629,7 +629,6 @@ int main(int argc, char **argv)
 
     if (gdbstub) {
         gdbserver_start(gdbstub, &error_fatal);
-        gdb_handlesig(cpu, 0, NULL, NULL, 0);
     }
     cpu_loop(env);
     /* never exits */
diff --git a/gdbstub/user.c b/gdbstub/user.c
index 8225b70280..3730f32c41 100644
--- a/gdbstub/user.c
+++ b/gdbstub/user.c
@@ -22,6 +22,7 @@
 #include "gdbstub/user.h"
 #include "gdbstub/enums.h"
 #include "hw/core/cpu.h"
+#include "user/signal.h"
 #include "trace.h"
 #include "internals.h"
 
@@ -393,32 +394,122 @@ static int gdbserver_open_port(int port, Error **errp)
     return fd;
 }
 
-bool gdbserver_start(const char *port_or_path, Error **errp)
+static bool gdbserver_accept(int port, int gdb_fd, const char *path)
 {
-    int port = g_ascii_strtoull(port_or_path, NULL, 10);
+    bool ret;
+
+    if (port > 0) {
+        ret = gdb_accept_tcp(gdb_fd);
+    } else {
+        ret = gdb_accept_socket(gdb_fd);
+        if (ret) {
+            gdbserver_user_state.socket_path = g_strdup(path);
+        }
+    }
+
+    if (!ret) {
+        close(gdb_fd);
+    }
+
+    return ret;
+}
+
+struct {
+    int port;
     int gdb_fd;
+    char *path;
+} gdbserver_args;
+
+static void do_gdb_handlesig(CPUState *cs, run_on_cpu_data arg)
+{
+    int sig;
+
+    sig = target_to_host_signal(gdb_handlesig(cs, 0, NULL, NULL, 0));
+    if (sig >= 1 && sig < NSIG) {
+        qemu_kill_thread(gdb_get_cpu_index(cs), sig);
+    }
+}
+
+static void *gdbserver_accept_thread(void *arg)
+{
+    if (gdbserver_accept(gdbserver_args.port, gdbserver_args.gdb_fd,
+                         gdbserver_args.path)) {
+        CPUState *cs = first_cpu;
+
+        async_safe_run_on_cpu(cs, do_gdb_handlesig, RUN_ON_CPU_NULL);
+        qemu_kill_thread(gdb_get_cpu_index(cs), host_interrupt_signal);
+    }
+
+    g_free(gdbserver_args.path);
+    gdbserver_args.path = NULL;
+
+    return NULL;
+}
 
+#define USAGE "\nUsage: -g {port|path}[,suspend={y|n}]"
+
+bool gdbserver_start(const char *args, Error **errp)
+{
+    g_auto(GStrv) argv = g_strsplit(args, ",", 0);
+    const char *port_or_path = NULL;
+    bool suspend = true;
+    int gdb_fd, port;
+    GStrv arg;
+
+    for (arg = argv; *arg; arg++) {
+        g_auto(GStrv) tokens = g_strsplit(*arg, "=", 2);
+
+        if (g_strcmp0(tokens[0], "suspend") == 0) {
+            if (tokens[1] == NULL) {
+                error_setg(errp,
+                           "gdbstub: missing \"suspend\" option value" USAGE);
+                return false;
+            } else if (!qapi_bool_parse(tokens[0], tokens[1],
+                                        &suspend, errp)) {
+                return false;
+            }
+        } else {
+            if (port_or_path) {
+                error_setg(errp, "gdbstub: unknown option \"%s\"" USAGE, *arg);
+                return false;
+            }
+            port_or_path = *arg;
+        }
+    }
+    if (!port_or_path) {
+        error_setg(errp, "gdbstub: port or path not specified" USAGE);
+        return false;
+    }
+
+    port = g_ascii_strtoull(port_or_path, NULL, 10);
     if (port > 0) {
         gdb_fd = gdbserver_open_port(port, errp);
     } else {
         gdb_fd = gdbserver_open_socket(port_or_path, errp);
     }
-
     if (gdb_fd < 0) {
         return false;
     }
 
-    if (port > 0 && gdb_accept_tcp(gdb_fd)) {
-        return true;
-    } else if (gdb_accept_socket(gdb_fd)) {
-        gdbserver_user_state.socket_path = g_strdup(port_or_path);
+    if (suspend) {
+        if (gdbserver_accept(port, gdb_fd, port_or_path)) {
+            gdb_handlesig(first_cpu, 0, NULL, NULL, 0);
+            return true;
+        } else {
+            error_setg(errp, "gdbstub: failed to accept connection");
+            return false;
+        }
+    } else {
+        QemuThread thread;
+
+        gdbserver_args.port = port;
+        gdbserver_args.gdb_fd = gdb_fd;
+        gdbserver_args.path = g_strdup(port_or_path);
+        qemu_thread_create(&thread, "gdb-accept",
+                           &gdbserver_accept_thread, NULL,
+                           QEMU_THREAD_DETACHED);
         return true;
     }
-
-    /* gone wrong */
-    close(gdb_fd);
-    error_setg(errp, "gdbstub: failed to accept connection");
-    return false;
 }
 
 void gdbserver_fork_start(void)
diff --git a/linux-user/main.c b/linux-user/main.c
index 7198fa0986..5c74c52cc5 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -1024,7 +1024,6 @@ int main(int argc, char **argv, char **envp)
 
     if (gdbstub) {
         gdbserver_start(gdbstub, &error_fatal);
-        gdb_handlesig(cpu, 0, NULL, NULL, 0);
     }
 
 #ifdef CONFIG_SEMIHOSTING
-- 
2.39.5


