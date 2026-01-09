Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67B69D16819
	for <qemu-rust@archiver.kernel.org>; Fri,  9 Jan 2026 11:45:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1veAvc-0005da-H4; Fri, 09 Jan 2026 06:45:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1veAvX-0005cn-Mq
 for qemu-rust@nongnu.org; Fri, 09 Jan 2026 06:45:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1veAvV-0005GN-Fp
 for qemu-rust@nongnu.org; Fri, 09 Jan 2026 06:45:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1767959108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=QM1RdZGzRe4uG8Rksl6ygiHz7KGi+nKBhe9Ml2QARXU=;
 b=HW2Oa7jt0W3kFLzAft57G7D6+uVV9cWnuy4agr5wcVxIJJDCMhEYUZM4vixTeXvZ6WBhnH
 WZPGbOSL0/gyVD8bm1TzvdsmTKjGzUZ1bB7PPA8Ib+gsr/xFCYSrWuSX05ZZeK/gZk2WU/
 L6nxkwdkHEGt9peYsfwPEeU055c9X8U=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-_JtVsjWdP0ukVZDyezlyCQ-1; Fri, 09 Jan 2026 06:45:07 -0500
X-MC-Unique: _JtVsjWdP0ukVZDyezlyCQ-1
X-Mimecast-MFC-AGG-ID: _JtVsjWdP0ukVZDyezlyCQ_1767959106
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-43102ac1da8so3061358f8f.2
 for <qemu-rust@nongnu.org>; Fri, 09 Jan 2026 03:45:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767959106; x=1768563906;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QM1RdZGzRe4uG8Rksl6ygiHz7KGi+nKBhe9Ml2QARXU=;
 b=RQkLIap7TqE8B9HSnH4sqt0iVbn+i4BbtudRM2tHwHyqWIpX5iFIDmhQ7NCxFwR31A
 NLv9THRy8OG/iqT4o990Nn/Yx8B6h74NQsItQQbNQsuTYXU0AIKARyY5efY/q2WP7TTZ
 Z83e+7BfkfSeAHq1jjIi7jzxhPlJHZKbZHHV0BJzM66nTB0VyyAnpRafzWQfr/8sNgTJ
 LRQutmY4y7LbWv1sDq4QYk5BGXxGbbvyG4eLl0zfK8R4ftPcEhCx1DIB6H5hJXBuHIvk
 BD7x+/CrOwdm0cDnMr7heSWHYFSw4dOBziShZK3EpHSv2UqcC/opIBTQO0Wn4SD+Gki0
 H9SQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVICWFkugAb4QFSj4NrHYzvHExkv2wW7BN2FovpsPbOVNY/rfbwQohccV85Xl7U22IC7ZknOAGAEzQ=@nongnu.org
X-Gm-Message-State: AOJu0Yy3djvquyR4Jhlxyw8Lax4HbJBSFyklP/LDO2+AkQdY7unE3cZM
 ecY3QLumtZHvtQJofO8/EQanq2+1QjPP7agklRZc9bVGG8pfB9h/QmbvCRzXF7zZfGMBNu3pGm3
 rGTeZxZk9xnXIgBI3SPi0w6PNdEO7fP+CuvVMlT8wkBu4Bzt4iUFpIGs=
X-Gm-Gg: AY/fxX7B83i3+Vjp4zbeucVVfe+IInTqdrwjfRudwxRVo3kUrNAgjZxbvczowMxs5U6
 tULSdgt3Vv+c8ornaXyD24WOquqAB4kc23Q32cDVyTTzlJFBpxaigNtkwZDy2IHvISgn1RbLKmM
 aSI0/bTnHaHunplfaGw3kx+Kab61WKv77OVc0+4SLfmxkRGd/pACJUDyJ10SyjljeyrS7U3AwEl
 TV90JV5pyb8C/xJOausNnkClBTs2UajB+DKiwWedzfj7sJ6DTcDoFfu/gK+pziJTJ1Y+3lGVh8r
 Ice18gR8AI2UWfxlVdwBlY/oSKoOzuoOKbMaUD195YVOHCdmjEEN3N+JFwa63pwBFvQUkF7pk3e
 GQA78/pSsgXGU6DWrho3q9y77qTa5GtnRqZBgxfOVqpcjyiAMjI1q2e6yWr77PpRlb/SfNDdKe3
 gG6PWWTskqr8GBUg==
X-Received: by 2002:a05:6000:288f:b0:42f:b9c6:c89b with SMTP id
 ffacd0b85a97d-432c379f286mr12324553f8f.50.1767959105697; 
 Fri, 09 Jan 2026 03:45:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFs8qwNwtGLMqmOFoVVJPuJyM+zbpODowggbSi6EBK1Oi8MmiKZOsb05UgnOM/dVVHyGkgTbg==
X-Received: by 2002:a05:6000:288f:b0:42f:b9c6:c89b with SMTP id
 ffacd0b85a97d-432c379f286mr12324520f8f.50.1767959105306; 
 Fri, 09 Jan 2026 03:45:05 -0800 (PST)
Received: from [192.168.10.48] ([151.61.26.160])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-432bd0e19bfsm21566505f8f.18.2026.01.09.03.45.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jan 2026 03:45:04 -0800 (PST)
Message-ID: <5cbc1f80-aef8-4bcd-beeb-af9c54eea3c8@redhat.com>
Date: Fri, 9 Jan 2026 12:45:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/24] util: set the name for the 'main' thread
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 "Dr. David Alan Gilbert" <dave@treblig.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 devel@lists.libvirt.org, qemu-block@nongnu.org, qemu-rust@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Kevin Wolf <kwolf@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20260108170338.2693853-1-berrange@redhat.com>
 <20260108170338.2693853-8-berrange@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <20260108170338.2693853-8-berrange@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4hx-7fbVLVyxRp6eDcCnxe_s_cETp__SW9QTeb4gLxI_1767959106
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 1/8/26 18:03, Daniel P. Berrangé wrote:
> The default main thread name is undefined, so use a constructor to
> explicitly set it to 'main'. This constructor is marked to run early
> as the thread name is intended to be used in error reporting / logs
> which may be triggered very early in QEMU execution.

At least on Linux I don't think we want to call the pthread function.

Since pthread_setname_np writes to /proc/self/task/tid/comm, wouldn't 
that cause ps to show qemu processes as "main" instead of "qemu" or 
"qemu-kvm"?

Paolo

> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Dr. David Alan Gilbert <dave@treblig.org>
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   util/qemu-thread-posix.c | 6 ++++++
>   util/qemu-thread-win32.c | 6 ++++++
>   2 files changed, 12 insertions(+)
> 
> diff --git a/util/qemu-thread-posix.c b/util/qemu-thread-posix.c
> index b1c127dbe3..afeac9ecad 100644
> --- a/util/qemu-thread-posix.c
> +++ b/util/qemu-thread-posix.c
> @@ -22,6 +22,12 @@
>   #include <pthread_np.h>
>   #endif
>   
> +static void __attribute__((__constructor__(QEMU_CONSTRUCTOR_EARLY)))
> +qemu_thread_init(void)
> +{
> +    qemu_thread_set_name("main");
> +}
> +
>   static void error_exit(int err, const char *msg)
>   {
>       fprintf(stderr, "qemu: %s: %s\n", msg, strerror(err));
> diff --git a/util/qemu-thread-win32.c b/util/qemu-thread-win32.c
> index 4d2d663a9a..8ca6429ad3 100644
> --- a/util/qemu-thread-win32.c
> +++ b/util/qemu-thread-win32.c
> @@ -22,6 +22,12 @@ typedef HRESULT (WINAPI *pSetThreadDescription) (HANDLE hThread,
>   static pSetThreadDescription SetThreadDescriptionFunc;
>   static HMODULE kernel32_module;
>   
> +static void __attribute__((__constructor__(QEMU_CONSTRUCTOR_EARLY)))
> +qemu_thread_init(void)
> +{
> +    qemu_thread_set_name("main");
> +}
> +
>   static bool load_set_thread_description(void)
>   {
>       static gsize _init_once = 0;


