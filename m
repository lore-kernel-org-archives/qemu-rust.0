Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tEAdb-0008Kv-I8
	for mharc-qemu-rust@gnu.org; Thu, 21 Nov 2024 12:06:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tEAdZ-00088S-4g
 for qemu-rust@nongnu.org; Thu, 21 Nov 2024 12:06:37 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tEAdR-0001Zr-0E
 for qemu-rust@nongnu.org; Thu, 21 Nov 2024 12:06:36 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43161e7bb25so9530805e9.2
 for <qemu-rust@nongnu.org>; Thu, 21 Nov 2024 09:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732208785; x=1732813585; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=idIcVKGpYjCDsx+KcIa06gkN9HyuOLEg0Ymsw5Q1ZdE=;
 b=r782XFJHMgK5HGG2p6y6i9+BHtyGGe+0ub3KPDvw46HrVpzBG4aX8lZxtGnR7e8c9M
 h6eaDAxGr+q27dnR05IqXe3M02yQHdvqvy+P7vhT+H+nFxqYQYkIQQ3xLSZa/0olIsa2
 ijwGRpDWeK4y7A6d5mC4rkw6tBDGYUlSHrgcp04v5UWyBfAQVGpnYfbLW8/irLdGjrv4
 fShYbpuPJaEA358oBB0hWwsIt4eOJGnuQEEiNYYdBczmpD/G1JzUdy43KDu6wS1C9+TW
 HQiAzSWsxwVjEgk+FD0sUwrMXUZsQCzfuhAkJKoIe2t0SyFSlqUE3TudGf7yUh7qqsZq
 JzKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732208785; x=1732813585;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=idIcVKGpYjCDsx+KcIa06gkN9HyuOLEg0Ymsw5Q1ZdE=;
 b=Qg693cAv1KMc2wpDoChW4Ejx0mvW4JLyUxScYLVBorp7R1rkK6rdeufbJ611+kopwG
 GJJ33vVj5OsWOqe06baN8N2n2HP0LTLKEEwgf1euKWge2c1847/6WPzRIfkq2DHQgSgs
 o8spBXAv0tPiVtO7Sp1I208WCocQD5KOfUJ73vH4n+u6SUbuFj9Jv3ZES0JnCpulNwtD
 DbbaMFdMCDHqniy9iDolnQfzH2gn3qgywGA0Lnn6zVVEemTtVr51MaVuVCvUBk51seDn
 ciuHDLZ8o8KSwFNwcdGhhE6MI2ENrIJl5WK6pQiGZb5Pi4C1M+pkM66VAK5lH9IIb+jw
 zRAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTH86WDK2BNrOpCP7ntR1slt7OBpYqm2lTBUcSaNNBmSduRrcpwFc8fVQH7eplWkEpjzQxo5zGuiw=@nongnu.org
X-Gm-Message-State: AOJu0YzOeHmw2D+yJn/kjRwwtvA1MO7RVZZHEkSZuPZnXlcRkhduZTZV
 chqlxJpzUCZ5gezpIpS8aCbr4X2408zwhVoOLFkpTa40zlEl3Y5C9YhtLP3nuqk=
X-Gm-Gg: ASbGncv8ZajpwKX7p136k5dg5iEO0eXrZqwmQxS1hbt9gHJx+9zhzFhq4x8T+rJ0b/7
 d6NOu0JokJX6v3JSS+9JA6KZ7jNS520OZdELbr068irTjzABUtn1XlNqb5QTWF3fwimhrBU0TTv
 CpjQNRwuyL+811bxU+vhsUomScM4sdj+ou0Q5duvfi1Hwu8uz84e67loJ2y2ooqsAqiaOg1YXa4
 ZqzS9wxRu7t7+k2JELtqz5Etrh9K8u32Oz1g2+e/9j5rQlY
X-Google-Smtp-Source: AGHT+IH6g5M3vTaVsS3CPENTsM7HsoWcPZRMPU6znIjdL1RjlqwiFqX8MvTPqIsvEGnUeu6izcb0BA==
X-Received: by 2002:a05:600c:c84:b0:431:5ed4:7e7d with SMTP id
 5b1f17b1804b1-433489d4d91mr68172095e9.18.1732208784265; 
 Thu, 21 Nov 2024 09:06:24 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-433b46172d5sm61230635e9.23.2024.11.21.09.06.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2024 09:06:23 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 9F3BD604E1;
 Thu, 21 Nov 2024 16:58:09 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-ppc@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alexandre Iooss <erdnaxe@crans.org>, qemu-riscv@nongnu.org,
 Thomas Huth <huth@tuxfamily.org>, Bernhard Beschow <shentey@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-s390x@nongnu.org,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 John Snow <jsnow@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-rust@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Markus Armbruster <armbru@redhat.com>,
 Weiwei Li <liwei1518@gmail.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Ani Sinha <anisinha@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH 35/39] plugins: add missing export for qemu_plugin_num_vcpus
Date: Thu, 21 Nov 2024 16:58:02 +0000
Message-Id: <20241121165806.476008-36-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241121165806.476008-1-alex.bennee@linaro.org>
References: <20241121165806.476008-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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
X-List-Received-Date: Thu, 21 Nov 2024 17:06:37 -0000

From: Pierrick Bouvier <pierrick.bouvier@linaro.org>

Fixes: 4a448b148ca ("plugins: add qemu_plugin_num_vcpus function")
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Message-Id: <20241112212622.3590693-2-pierrick.bouvier@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/qemu/qemu-plugin.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
index 622c9a0232..0fba36ae02 100644
--- a/include/qemu/qemu-plugin.h
+++ b/include/qemu/qemu-plugin.h
@@ -803,6 +803,7 @@ void qemu_plugin_register_atexit_cb(qemu_plugin_id_t id,
                                     qemu_plugin_udata_cb_t cb, void *userdata);
 
 /* returns how many vcpus were started at this point */
+QEMU_PLUGIN_API
 int qemu_plugin_num_vcpus(void);
 
 /**
-- 
2.39.5


