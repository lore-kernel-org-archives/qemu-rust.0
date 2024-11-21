Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tEEIf-0006bR-EU
	for mharc-qemu-rust@gnu.org; Thu, 21 Nov 2024 16:01:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tED3c-0001TO-Nu
 for qemu-rust@nongnu.org; Thu, 21 Nov 2024 14:41:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tED3a-0006VR-Nd
 for qemu-rust@nongnu.org; Thu, 21 Nov 2024 14:41:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1732218098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=U+74IKXBfX76Hsz8vjGkl972OkUA9XQ4WAykI0zzAQw=;
 b=CXNOjjgj6n1hIIA7TfBgX2tXebZkGseMg9L61DNSBd6rs0DAlZEAxM4ufbUoexbBX20Enf
 KqpvhZHhHUCvx+HgIwnX8Cxfkwd/eNt0/ujL39LyGWE2Ol1Fe9drLnV01kWDE13jg6TD8J
 m15UkAQtnCc4KxiE2mgSj9Bli+dv3cY=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-693-DPOW2lpRMb-rHBRK03iSXw-1; Thu, 21 Nov 2024 14:41:36 -0500
X-MC-Unique: DPOW2lpRMb-rHBRK03iSXw-1
X-Mimecast-MFC-AGG-ID: DPOW2lpRMb-rHBRK03iSXw
Received: by mail-lf1-f70.google.com with SMTP id
 2adb3069b0e04-539fb5677c9so1196175e87.0
 for <qemu-rust@nongnu.org>; Thu, 21 Nov 2024 11:41:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732218094; x=1732822894;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=U+74IKXBfX76Hsz8vjGkl972OkUA9XQ4WAykI0zzAQw=;
 b=rUqS+W65WXKquQnVUZFqBrkfopAL6DSg9iK34zeEfb1XMJtDEfGU/HtkyZ/1ASZgy4
 QJ+HBllQVNfKzd3mgdLa1gwZfJnKf28XrbWPghSRRkAg+c3V67rtceVxaRPTfLY1/rd4
 wgG0Y+IvDAvgtXwEAgjhRQJwPgTfxTKCeygm/wGJlLNmb08Dr/FS+LfZIJxuQZrb3ogo
 agT6iTsT2BJUZtV9h6H4r3a9y8EbFQhsHI7+0jEUhnhPJFIdj56lYvAq1KNg2CB/T+l3
 dQNsTgOV5mLpUNzD0b9xmFOK7OA3Tki6a2t5SJWbvP0mDK2UBnbHDGml06LpO+oRRJca
 ckpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUz+p+T5jgtgKfqiQtWHJEmx1CjAoEl/Qd7TeOzdt+ZCqXAmYyRo5K4eUz5S9wo63vSJPgV6i96vZI=@nongnu.org
X-Gm-Message-State: AOJu0Yxtp0NWKA6RzSDcPP/oBOhhF3cE7EYU1EpnEJGKlRFJHBq7rs/a
 VthcJ0ec3hnJ6X+m53zdi5DPTT1cKGUKRk+e0/S19t3TUfFLknJZ4/lSXUn2TgCoaVsUlAkIJXZ
 BfCNE9GwOIUj9MRdyH49EiCd3qwSCygJNxq19+ATacg4z9HD+pfM=
X-Gm-Gg: ASbGncv2T1apE+TiC0i7eTdDwtLSDZll+KLBVRs9JB1SP6cgJAlTboyMsB6Esy4dQbz
 40cKutSZqOvLcNZ5hWg12O965N+pvEvVjEUmXRDFqf1+S2ZuUtGb/IiCUOYQt7zKF938X7er3vh
 9xLuIMbinprwv5rxLIXZdIlVoTi5XOvyi7rDwyh+rEg5dCojOoG9pE12Nf9kLy/SVoYOWtJopC3
 UYmiRWhb4MSIgQEFOKpetWT5Up5VnUJmZvJs9NBIgfcZUOvMhu2EF81PR+L6BPDeTmZAECnN0Cz
 Z34=
X-Received: by 2002:a05:6512:3e09:b0:539:9524:92bc with SMTP id
 2adb3069b0e04-53dc136de98mr4591509e87.55.1732218093822; 
 Thu, 21 Nov 2024 11:41:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFAOv2Hbg1AVnnkEQijZMhiu4NsYBIUOxDyDjgKet5h5h526Pk9yCTnwALxfPQSanrlKmQmkA==
X-Received: by 2002:a05:6512:3e09:b0:539:9524:92bc with SMTP id
 2adb3069b0e04-53dc136de98mr4591490e87.55.1732218093423; 
 Thu, 21 Nov 2024 11:41:33 -0800 (PST)
Received: from [192.168.0.7] (ip-109-42-51-70.web.vodafone.de. [109.42.51.70])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa50b2f5402sm7750366b.68.2024.11.21.11.41.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Nov 2024 11:41:33 -0800 (PST)
Message-ID: <abaf7618-96dc-416a-b0dc-2ead6c16e45b@redhat.com>
Date: Thu, 21 Nov 2024 20:41:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/39] tests/functional: add a QMP backdoor for debugging
 stalled tests
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
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
 Eric Farman <farman@linux.ibm.com>, Bin Meng <bmeng.cn@gmail.com>,
 qemu-s390x@nongnu.org, Niek Linnenbank <nieklinnenbank@gmail.com>,
 qemu-arm@nongnu.org, John Snow <jsnow@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-rust@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Markus Armbruster <armbru@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Ani Sinha <anisinha@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>
References: <20241121165806.476008-1-alex.bennee@linaro.org>
 <20241121165806.476008-18-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20241121165806.476008-18-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: P3hctPrIlQuspGbIMwxRQfTCFOKr6YIl5sNDmvgIxl8_1732218094
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.14,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 21 Nov 2024 16:01:12 -0500
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
X-List-Received-Date: Thu, 21 Nov 2024 19:41:40 -0000

On 21/11/2024 17.57, Alex Bennée wrote:
> From: Daniel P. Berrangé <berrange@redhat.com>
> 
> Support the QEMU_TEST_QMP_BACKDOOR=backdoor.sock env variable as a
> way to get a QMP backdoor for debugging a stalled QEMU test. Most
> typically this would be used if running the tests directly:
> 
>   $ QEMU_TEST_QMP_BACKDOOR=backdoor.sock \
>     QEMU_TEST_QEMU_BINARY=./build/qemu-system-arm \
>     PYTHONPATH=./python \
>     ./tests/functional/test_arm_tuxrun.py
> 
> And then, when the test stalls, in a second shell run:
> 
>   $ ./scripts/qmp/qmp-shell backdoor.sock
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> Message-Id: <20241121154218.1423005-18-berrange@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   docs/devel/testing/functional.rst      | 10 ++++++++++
>   tests/functional/qemu_test/testcase.py |  7 +++++++
>   2 files changed, 17 insertions(+)
> 
> diff --git a/docs/devel/testing/functional.rst b/docs/devel/testing/functional.rst
> index 6b5d0c5b98..b8ad7b0bf7 100644
> --- a/docs/devel/testing/functional.rst
> +++ b/docs/devel/testing/functional.rst
> @@ -176,6 +176,16 @@ primarily depend on the value of the ``qemu_bin`` class attribute.
>   If it is not explicitly set by the test code, its default value will
>   be the result the QEMU_TEST_QEMU_BINARY environment variable.
>   
> +Debugging hung QEMU
> +^^^^^^^^^^^^^^^^^^^
> +
> +When test cases go wrong it may be helpful to debug a stalled QEMU
> +process. While the QEMUMachine class owns the primary QMP monitor
> +socket, it is possible to request a second QMP monitor be created
> +by setting the ``QEMU_TEST_QMP_BACKDOOR`` env variable to refer
> +to a UNIX socket name. The ``qmp-shell`` command can then be
> +attached to the stalled QEMU to examine its live state.
> +
>   Attribute reference
>   -------------------
>   
> diff --git a/tests/functional/qemu_test/testcase.py b/tests/functional/qemu_test/testcase.py
> index e2a329c3e5..fceafb32b0 100644
> --- a/tests/functional/qemu_test/testcase.py
> +++ b/tests/functional/qemu_test/testcase.py
> @@ -175,6 +175,13 @@ def _new_vm(self, name, *args):
>                            log_dir=self.logdir)
>           self.log.debug('QEMUMachine "%s" created', name)
>           self.log.debug('QEMUMachine "%s" temp_dir: %s', name, vm.temp_dir)
> +
> +        sockpath = os.environ.get("QEMU_TEST_QMP_BACKDOOR", None)
> +        if sockpath is not None:
> +            vm.add_args("-chardev",
> +                        f"socket,id=backdoor,path={sockpath},server=on,wait=off",
> +                        "-mon", "chardev=backdoor,mode=control")
> +
>           if args:
>               vm.add_args(*args)
>           return vm

Reviewed-by: Thomas Huth <thuth@redhat.com>


